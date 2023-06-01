package domain

import (
	"backend/apis/infrastructure"
	"backend/apis/models"
	"context"
)

type CategoryInterface interface {
	CheckCategory(ctx context.Context, cat string) (bool, error)
	AddCategory(ctx context.Context, cat string) error
	GetCategory(ctx context.Context) (models.Category, error)
}

type Category struct {
	Category infrastructure.CategoryRepo
}

func (bs *Category) CheckCategory(ctx context.Context, cat string) (bool, error) {
	Isexist, err := bs.Category.CheckCategoryRepository(ctx, cat)
	if err != nil {
		return false, err
	}
	return Isexist, nil
}

func (bs *Category) AddCategory(ctx context.Context, cat string) error {
	err := bs.Category.AddCategoryRepository(ctx, cat)
	if err != nil {
		return err
	}
	return nil
}
func (bs *Category) GetCategory(ctx context.Context) ([]models.Category, error) {
	data, err := bs.Category.GetCategory(ctx)
	if err != nil {
		return []models.Category{}, err
	}
	return data, nil
}
