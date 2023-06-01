package infrastructure

import (
	"backend/apis/models"
	"context"
	"database/sql"
	"fmt"
	"time"
)

type ComplaintDB struct {
	DB *sql.DB
}

type ComplaintRepo interface {
	ComplaintRepository(ctx context.Context, req models.ComplaintRequest) error
	GetComplaint(ctx context.Context) ([]models.Complaint, error)
}

func (b *ComplaintDB) ComplaintRepository(ctx context.Context, req models.ComplaintRequest) error {
	_, err := b.DB.ExecContext(ctx, "Insert into complaints (date, division, category, title, description, name, address, mobile, updated_at) values ($1, $2, $3, $4, $5, $6, $7, $8, $9)", req.Date, req.Division, req.Category, req.Title, req.Description, req.Name, req.Address, req.Mobile, time.Now())
	if err != nil {
		return err
	}
	return nil
}

func (b *ComplaintDB) GetComplaint(ctx context.Context) ([]models.Complaint, error) {
	rows, err := b.DB.QueryContext(ctx, "select * from complaints")
	if err != nil {
		return []models.Complaint{}, err
	}
	var data []models.Complaint
	for rows.Next() {
		var user models.Complaint
		err = rows.Scan(&user.Id, &user.Date, &user.Division, &user.Category, &user.Title, &user.Description, &user.Name, &user.Address, &user.Mobile, &user.Updated_at)
		if err != nil {
			return data, err
		}
		data = append(data, user)
	}
	fmt.Println("DATA", data)
	return data, nil
}
