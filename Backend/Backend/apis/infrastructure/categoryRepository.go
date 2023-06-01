package infrastructure

import (
	"backend/apis/models"
	"context"
	"database/sql"
	"fmt"
	"time"
)

type CategoryDB struct {
	DB *sql.DB
}

type CategoryRepo interface {
	CheckCategoryRepository(ctx context.Context, div string) (bool, error)
	AddCategoryRepository(ctx context.Context, div string) error
	GetCategory(ctx context.Context) ([]models.Category, error)
}

func (b *CategoryDB) CheckCategoryRepository(ctx context.Context, div string) (bool, error) {
	var count int
	err := b.DB.QueryRowContext(ctx, "SELECT count(*) FROM categories WHERE category = $1", div).Scan(&count)
	if err != nil {
		return false, err
	}
	return count > 0, nil
}

func (b *CategoryDB) AddCategoryRepository(ctx context.Context, div string) error {

	_, err := b.DB.ExecContext(ctx, "Insert into categories (category, updated_at) values ($1, $2)", div, time.Now())
	if err != nil {
		// tx.Rollback()
		return err
	}

	return nil
}
func (b *CategoryDB) GetCategory(ctx context.Context) ([]models.Category, error) {
	var data []models.Category
	rows, err := b.DB.QueryContext(ctx, "SELECT * FROM categories")
	if err != nil {
		return data, err
	}

	for rows.Next() {
		var category models.Category
		err = rows.Scan(&category.Id, &category.Category, &category.Updated_at)
		if err != nil {
			return data, err
		}
		data = append(data, category)

	}
	fmt.Println("DATA", data)
	return data, nil
}
