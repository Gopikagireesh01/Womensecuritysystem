package main

import (
	"backend/apis/domain"
	"backend/apis/handler"
	"backend/apis/infrastructure"
	"database/sql"
	"fmt"
	"log"
	"net/http"

	_ "github.com/lib/pq"

	"github.com/gorilla/mux"
	"github.com/rs/cors"
	"github.com/spf13/viper"
)

type Config struct {
	DBDriver   string `mapstructure:"DB_DRIVER"`
	DBHost     string `mapstructure:"DB_HOST"`
	DBName     string `mapstructure:"DB_NAME"`
	DBUser     string `mapstructure:"DB_USER"`
	DBPassword string `mapstructure:"DB_PASSWORD"`
	DBPort     int    `mapstructure:"DB_PORT"`
	APISecret  string `mapstructure:"API_SECRET"`
}

func main() {
	config, err := LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}
	fmt.Println(config.DBHost, config.DBPort, config.DBUser, config.DBPassword, config.DBName, "DBCONFIG")
	db, err := sql.Open("postgres", fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		config.DBHost, config.DBPort, config.DBUser, config.DBPassword, config.DBName))

	if err != nil {
		log.Fatalf("error opening database: %v", err)
	} else {
		fmt.Print("Connected database successfully")
	}
	defer db.Close()

	userChecker := &infrastructure.UserDB{DB: db}
	userService := &domain.UserService{UserChecker: userChecker}
	userhandler := &handler.HttpHandler{UserService: userService}

	divisionDB := &infrastructure.DivisionDB{DB: db}
	division := &domain.Division{Division: divisionDB}
	divisionhandler := &handler.HttpDivisionHandler{Division: *division}

	categoryDB := &infrastructure.CategoryDB{DB: db}
	category := &domain.Category{Category: categoryDB}
	categoryhandler := &handler.HttpCategoryHandler{Category: *category}

	complaintDB := &infrastructure.ComplaintDB{DB: db}
	complaint := &domain.ComplaintService{Complaint: complaintDB}
	complainthandler := &handler.HttpComplaintHandler{ComplaintService: complaint}

	r := mux.NewRouter()
	c := cors.New(cors.Options{
		AllowedOrigins:   []string{"http://*"},
		AllowCredentials: true,
		AllowedMethods:   []string{http.MethodGet, http.MethodPost, http.MethodPatch, http.MethodDelete},
	})

	r.HandleFunc("/login", userhandler.CheckUser).Methods("GET")
	r.HandleFunc("/policelogin", userhandler.CheckPolice).Methods("GET")
	r.HandleFunc("/adminlogin", userhandler.CheckAdmin).Methods("GET")
	r.HandleFunc("/signup", userhandler.SignUpHandler).Methods("POST")
	r.HandleFunc("/signuppolice", userhandler.SignUpPoliceHandler).Methods("POST")
	r.HandleFunc("/adddivision", divisionhandler.DivisionHandler).Methods("POST")
	r.HandleFunc("/addcategory", categoryhandler.CategoryHandler).Methods("POST")
	r.HandleFunc("/registercomplaint", complainthandler.ComplaintHandler).Methods("POST")
	r.HandleFunc("/sendsms", handler.SMSHandler).Methods("POST")
	r.HandleFunc("/getusers", userhandler.GetUsers).Methods("GET")
	r.HandleFunc("/getcomplaints", complainthandler.GetComplaint).Methods("GET")
	r.HandleFunc("/getcategories", categoryhandler.GetCategory).Methods("GET")
	r.HandleFunc("/getdivision", divisionhandler.GetDivision).Methods("GET")

	// serve the app
	fmt.Println("Server at 8080")
	h := c.Handler(r)
	err = http.ListenAndServe(":8080", h)
	if err != nil {
		fmt.Println("error starting server:", err)
		return
	}
}

func LoadConfig(path string) (config Config, err error) {
	viper.AddConfigPath(path)
	viper.SetConfigName("app")
	viper.SetConfigType("env")

	viper.AutomaticEnv()

	err = viper.ReadInConfig()
	if err != nil {
		return
	}

	err = viper.Unmarshal(&config)
	return
}
