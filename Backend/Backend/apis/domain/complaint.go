package domain

import (
	"backend/apis/infrastructure"
	"backend/apis/models"
	"context"
)

type ComplaintServiceInterface interface {
	RegisterComplaint(ctx context.Context, req models.ComplaintRequest) error
	GetComplaint(ctx context.Context) ([]models.Complaint, error)
}

type ComplaintService struct {
	Complaint infrastructure.ComplaintRepo
}

func (us *ComplaintService) RegisterComplaint(ctx context.Context, req models.ComplaintRequest) error {
	err := us.Complaint.ComplaintRepository(ctx, req)
	if err != nil {
		return err
	}
	return nil
}
func (us *ComplaintService) GetComplaint(ctx context.Context) ([]models.Complaint, error) {
	data, err := us.Complaint.GetComplaint(ctx)
	if err != nil {
		return []models.Complaint{}, err
	}
	return data, nil
}
