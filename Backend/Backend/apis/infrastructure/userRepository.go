package infrastructure

import (
	"backend/apis/models"
	"context"
	"database/sql"
	"fmt"
	"time"
)

type UserDB struct {
	DB *sql.DB
}

type UserChecker interface {
	CheckUserRepository(ctx context.Context, username string) (bool, string, string, error)
	CheckAdminRepository(ctx context.Context, username string) (bool, string, string, error)
	CheckPoliceRepository(ctx context.Context, username string) (bool, string, string, error)
	SignUpRepository(ctx context.Context, m models.SignupRequest) (bool, error)
	SignUpPoliceRepository(ctx context.Context, m models.SignupPoliceRequest) (bool, error)
	GetUserByEmail(ctx context.Context, email string) (bool, error)
	GetUsers(ctx context.Context) ([]models.User, error)
}

func (u *UserDB) CheckUserRepository(ctx context.Context, username string) (bool, string, string, error) {
	var count int
	var name, dbpassword string

	err := u.DB.QueryRowContext(ctx, "SELECT COUNT(*),name, password FROM users WHERE email = $1 group by name, password", username).Scan(&count, &name, &dbpassword)
	if err != nil {
		return false, "", "", err
	}
	return count > 0, name, dbpassword, nil
}
func (u *UserDB) CheckPoliceRepository(ctx context.Context, username string) (bool, string, string, error) {
	var count int
	var name, dbpassword string

	err := u.DB.QueryRowContext(ctx, "SELECT COUNT(*),name, password FROM police WHERE email = $1 group by name, password", username).Scan(&count, &name, &dbpassword)
	if err != nil {
		return false, "", "", err
	}
	return count > 0, name, dbpassword, nil
}
func (u *UserDB) CheckAdminRepository(ctx context.Context, username string) (bool, string, string, error) {
	var count int
	var name, dbpassword string

	err := u.DB.QueryRowContext(ctx, "SELECT COUNT(*),name, password FROM admin WHERE email = $1 group by name, password", username).Scan(&count, &name, &dbpassword)
	if err != nil {
		return false, "", "", err
	}
	return count > 0, name, dbpassword, nil
}

func (u *UserDB) GetUserByEmail(ctx context.Context, email string) (bool, error) {
	var count int
	err := u.DB.QueryRowContext(ctx, "SELECT COUNT(*) FROM users WHERE email = $1", email).Scan(&count)
	fmt.Println("COUNT", count)
	if err != nil {
		return false, err
	}
	return count > 0, nil
}
func (u *UserDB) SignUpRepository(ctx context.Context, m models.SignupRequest) (bool, error) {
	var count int64

	result, err := u.DB.ExecContext(ctx, "INSERT INTO users (name, email, password, mobile, address, city, guardian_name, guardian_mobile, updated_at) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)", m.Name, m.Email, m.Password, m.Mobile, m.Address, m.City, m.GuardianName, m.GuardianMobile, time.Now())
	fmt.Println(err)
	if err != nil {
		return false, err
	}

	count, err = result.RowsAffected()
	fmt.Println(err)
	if err != nil {
		return false, err
	}

	return count > 0, nil
}

func (u *UserDB) SignUpPoliceRepository(ctx context.Context, m models.SignupPoliceRequest) (bool, error) {
	var count int64

	result, err := u.DB.ExecContext(ctx, "INSERT INTO police (name, email, password, mobile, reference_id, type, division, address, pincode, district, updated_at) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)", m.Name, m.Email, m.Password, m.Mobile, m.Reference_id, m.Type, m.Division, m.Address, m.Pincode, m.District, time.Now())
	fmt.Println(err)
	if err != nil {
		return false, err
	}

	count, err = result.RowsAffected()
	fmt.Println(err)
	if err != nil {
		return false, err
	}

	return count > 0, nil
}
func (u *UserDB) GetUsers(ctx context.Context) ([]models.User, error) {
	var data []models.User
	rows, err := u.DB.QueryContext(ctx, "SELECT * FROM users")
	if err != nil {
		return data, err
	}

	for rows.Next() {
		var user models.User
		err = rows.Scan(&user.Id, &user.Name, &user.Email, &user.Password, &user.Mobile, &user.Address, &user.City, &user.GuardianName, &user.GuardianMobile, &user.Updated_at)
		if err != nil {
			return data, err
		}
		data = append(data, user)
	}
	fmt.Println("DATA", data)
	return data, nil
}
