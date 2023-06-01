package handler

import (
	"backend/apis/domain"
	"backend/apis/models"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/dgrijalva/jwt-go"
)

var secretKey = []byte("my-secret-key")

type HttpHandler struct {
	UserService domain.UserServiceInterface
}

func (h *HttpHandler) CheckUser(w http.ResponseWriter, r *http.Request) {

	// Only allow GET and POST requests
	if r.Method != "GET" && r.Method != "POST" {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse URL parameters
	username := r.URL.Query().Get("username")
	password := r.URL.Query().Get("password")

	// Check if username and password are provided
	if username == "" || password == "" {
		http.Error(w, "username and password are required", http.StatusBadRequest)
		return
	}

	// Check if user exists
	exists, name, err := h.UserService.CheckUser(r.Context(), username, password)
	if err != nil {
		http.Error(w, fmt.Sprintf("error checking user: %v", err), http.StatusInternalServerError)
		return
	}
	if !exists {
		http.Error(w, "Username and password not found.", http.StatusUnauthorized)
		return
	}

	// Generate JWT token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"username": username,
		"exp":      time.Now().Add(time.Hour * 24).Unix(),
	})
	tokenString, err := token.SignedString(secretKey)
	if err != nil {
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	// Return token to client
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"token": tokenString, "name": name})
}
func (h *HttpHandler) CheckAdmin(w http.ResponseWriter, r *http.Request) {

	// Only allow GET and POST requests
	if r.Method != "GET" && r.Method != "POST" {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse URL parameters
	username := r.URL.Query().Get("username")
	password := r.URL.Query().Get("password")

	// Check if username and password are provided
	if username == "" || password == "" {
		http.Error(w, "username and password are required", http.StatusBadRequest)
		return
	}

	// Check if user exists
	exists, name, err := h.UserService.CheckAdmin(r.Context(), username, password)
	if err != nil {
		http.Error(w, fmt.Sprintf("error checking user: %v", err), http.StatusInternalServerError)
		return
	}
	if !exists {
		http.Error(w, "Username and password not found.", http.StatusUnauthorized)
		return
	}

	// Generate JWT token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"username": username,
		"exp":      time.Now().Add(time.Hour * 24).Unix(),
	})
	tokenString, err := token.SignedString(secretKey)
	if err != nil {
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	// Return token to client
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"token": tokenString, "name": name})
}
func (h *HttpHandler) CheckPolice(w http.ResponseWriter, r *http.Request) {

	// Only allow GET and POST requests
	if r.Method != "GET" && r.Method != "POST" {
		http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		return
	}

	// Parse URL parameters
	username := r.URL.Query().Get("username")
	password := r.URL.Query().Get("password")

	// Check if username and password are provided
	if username == "" || password == "" {
		http.Error(w, "username and password are required", http.StatusBadRequest)
		return
	}

	// Check if user exists
	exists, name, err := h.UserService.CheckPolice(r.Context(), username, password)
	if err != nil {
		http.Error(w, fmt.Sprintf("error checking user: %v", err), http.StatusInternalServerError)
		return
	}
	if !exists {
		http.Error(w, "Username and password not found.", http.StatusUnauthorized)
		return
	}

	// Generate JWT token
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"username": username,
		"exp":      time.Now().Add(time.Hour * 24).Unix(),
	})
	tokenString, err := token.SignedString(secretKey)
	if err != nil {
		http.Error(w, "Internal server error", http.StatusInternalServerError)
		return
	}

	// Return token to client
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{"token": tokenString, "name": name})
}

func (h *HttpHandler) SignUpHandler(w http.ResponseWriter, r *http.Request) {
	// Parse the signup request from the HTTP request body
	var signupReq models.SignupRequest
	err := json.NewDecoder(r.Body).Decode(&signupReq)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	// Check if email already exist in the database
	email, err := h.UserService.GetUserByEmail(r.Context(), signupReq.Email)
	if email {
		http.Error(w, "Email already exists", http.StatusBadRequest)
		return
	}
	if err != nil {
		fmt.Println(err, "ERR")
		http.Error(w, "Error in getting gmail", http.StatusInternalServerError)
		return
	}
	// Call the SignUp function of the UserService handler
	success, err := h.UserService.SignUp(r.Context(), signupReq)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	fmt.Println(success)
	// Write the response to the HTTP response writer
	w.WriteHeader(http.StatusOK)
	fmt.Fprint(w, "User created")
}

func (h *HttpHandler) SignUpPoliceHandler(w http.ResponseWriter, r *http.Request) {
	// Parse the signup request from the HTTP request body
	var signupReq models.SignupPoliceRequest
	err := json.NewDecoder(r.Body).Decode(&signupReq)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Check if email already exist in the database
	email, err := h.UserService.GetUserByEmail(r.Context(), signupReq.Email)
	if email {
		http.Error(w, "Email already exists", http.StatusBadRequest)
		return
	}
	if err != nil {
		fmt.Println(err, "ERR")
		http.Error(w, "Error in getting gmail", http.StatusInternalServerError)
		return
	}
	// Call the SignUp function of the UserService handler
	_, err = h.UserService.SignUpPolice(r.Context(), signupReq)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	// Write the response to the HTTP response writer
	w.WriteHeader(http.StatusOK)
	fmt.Fprint(w, "police added")
}
func (h *HttpHandler) GetUsers(w http.ResponseWriter, r *http.Request) {
	// Parse the signup request from the HTTP request body

	// Call the SignUp function of the UserService handler
	data, err := h.UserService.GetUsers(r.Context())
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	fmt.Println(data)
	// Write the response to the HTTP response writer
	err = json.NewEncoder(w).Encode(data)
	// w.WriteHeader(http.StatusOK)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

}
