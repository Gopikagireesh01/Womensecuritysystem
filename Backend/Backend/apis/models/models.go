package models

type SignupRequest struct {
	Name           string `json:"name"`
	Email          string `json:"username"`
	Password       string `json:"password"`
	Mobile         string `json:"mobile"`
	Address        string `json:"address"`
	City           string `json:"city"`
	GuardianName   string `json:"guardian_name"`
	GuardianMobile string `json:"guardian_mobile"`
}
type User struct {
	Id             int    `json:"id"`
	Name           string `json:"name"`
	Email          string `json:"username"`
	Password       string `json:"password"`
	Mobile         string `json:"mobile"`
	Address        string `json:"address"`
	City           string `json:"city"`
	GuardianName   string `json:"guardian_name"`
	GuardianMobile string `json:"guardian_mobile"`
	Updated_at     string `json:"updated_at"`
}

type SignupPoliceRequest struct {
	Name         string `json:"name"`
	Email        string `json:"username"`
	Password     string `json:"password"`
	Mobile       string `json:"mobile"`
	Reference_id int    `json:"reference_id"`
	Type         string `json:"type"`
	Division     string `json:"division"`
	Address      string `json:"address"`
	Pincode      int64  `json:"pincode"`
	District     string `json:"district"`
}
type Police struct {
	Id           string `json:"id"`
	Name         string `json:"name"`
	Email        string `json:"username"`
	Password     string `json:"password"`
	Mobile       string `json:"mobile"`
	Reference_id int    `json:"reference_id"`
	Type         string `json:"type"`
	Division     string `json:"division"`
	Address      string `json:"address"`
	Pincode      int64  `json:"pincode"`
	District     string `json:"district"`
	Updated_at   string `json:"updated_at"`
}

type ComplaintRequest struct {
	Date        string `json:"date"`
	Division    string `json:"division"`
	Category    string `json:"category"`
	Title       string `json:"title"`
	Description string `json:"description"`
	Name        string `json:"name"`
	Address     string `json:"address"`
	Mobile      string `json:"mobile"`
	Status      string `json:"status"`
}
type Complaint struct {
	Id          string `json:"id"`
	Date        string `json:"date"`
	Division    string `json:"division"`
	Category    string `json:"category"`
	Title       string `json:"title"`
	Description string `json:"description"`
	Name        string `json:"name"`
	Address     string `json:"address"`
	Mobile      string `json:"mobile"`
	Status      string `json:"status"`
	Updated_at  string `json:"updated_at"`
}
type Category struct {
	Id         string `json:"id"`
	Category   string `json:"category"`
	Updated_at string `json:"updated_at"`
}
type Division struct {
	Id         string `json:"id"`
	Category   string `json:"division"`
	Updated_at string `json:"updated_at"`
}
