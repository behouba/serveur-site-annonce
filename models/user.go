package models

import (
	"fmt"

	"github.com/badoux/checkmail"
)

type User struct {
	Name     string `json:"name"`
	Email    string `json:"email"`
	Password string `json:"password"`
}

func ValidateEmailRegistration(user User) (err error) {
	err = checkmail.ValidateHost(user.Email)
	if err != nil {
		fmt.Println(err)
		return err
	}
	return
}
