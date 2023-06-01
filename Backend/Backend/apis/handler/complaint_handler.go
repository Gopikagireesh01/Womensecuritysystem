package handler

import (
	"backend/apis/domain"
	"backend/apis/models"
	"encoding/json"
	"fmt"
	"net/http"
)

type HttpComplaintHandler struct {
	ComplaintService domain.ComplaintServiceInterface
}

func (h *HttpComplaintHandler) ComplaintHandler(w http.ResponseWriter, r *http.Request) {
	// Parse the signup request from the HTTP request body
	var Req models.ComplaintRequest
	err := json.NewDecoder(r.Body).Decode(&Req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Register complaint
	err = h.ComplaintService.RegisterComplaint(r.Context(), Req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	// Write the response to the HTTP response writer
	w.WriteHeader(http.StatusOK)
	fmt.Fprint(w, "Complaint registered successfully")
}
func (h *HttpComplaintHandler) GetComplaint(w http.ResponseWriter, r *http.Request) {
	// Parse the signup request from the HTTP request body

	// Register complaint
	data, err := h.ComplaintService.GetComplaint(r.Context())
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	// Write the response to the HTTP response writer
	err = json.NewEncoder(w).Encode(data)
	// w.WriteHeader(http.StatusOK)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
}
