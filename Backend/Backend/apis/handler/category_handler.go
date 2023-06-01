package handler

import (
	"backend/apis/domain"
	"encoding/json"
	"fmt"
	"net/http"
)

type HttpCategoryHandler struct {
	Category domain.Category
}

// add category
func (h *HttpCategoryHandler) CategoryHandler(w http.ResponseWriter, r *http.Request) {
	category := r.URL.Query().Get("category")

	// Check if seat is available
	Isexist, err := h.Category.CheckCategory(r.Context(), category)
	if err != nil {
		fmt.Println(err)
		http.Error(w, "Error in getting status of category", http.StatusBadRequest)
		return
	}
	if !Isexist {
		err = h.Category.AddCategory(r.Context(), category)
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
	} else {
		http.Error(w, "Category already exists.", http.StatusNotFound)
		return
	}
	// Write the response to the HTTP response writer
	w.WriteHeader(http.StatusOK)
	fmt.Fprint(w, "Added category successfully")
}
func (h *HttpCategoryHandler) GetCategory(w http.ResponseWriter, r *http.Request) {

	// Check if seat is available
	data, err := h.Category.GetCategory(r.Context())
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	err = json.NewEncoder(w).Encode(data)
	// w.WriteHeader(http.StatusOK)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
}
