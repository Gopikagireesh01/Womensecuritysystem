package domain

import (
	"backend/apis/infrastructure"
	"backend/apis/models"
	"context"
)

type DivisionInterface interface {
	CheckDivision(ctx context.Context, div string) (bool, error)
	AddDivision(ctx context.Context, div string) error
	GetDivision(ctx context.Context) ([]models.Division, error)
}

type Division struct {
	Division infrastructure.DivisionRepo
}

func (bs *Division) CheckDivision(ctx context.Context, div string) (bool, error) {
	Isexist, err := bs.Division.CheckDivisionRepository(ctx, div)
	if err != nil {
		return false, err
	}
	return Isexist, nil
}

func (bs *Division) AddDivision(ctx context.Context, div string) error {
	err := bs.Division.AddDivisionRepository(ctx, div)
	if err != nil {
		return err
	}
	return nil
}
func (bs *Division) GetDivision(ctx context.Context) ([]models.Division, error) {
	data, err := bs.Division.GetDivision(ctx)
	if err != nil {
		return []models.Division{}, err
	}
	return data, nil
}
