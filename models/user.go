package models

import (
	"database/sql"
	"errors"
	"regexp"

	"github.com/astaxie/beego/context"

	"github.com/badoux/checkmail"
	"github.com/satori/go.uuid"
	"golang.org/x/crypto/bcrypt"
)

// RegistrationError custon error struct for request error response
type RegistrationError struct {
	ErrMessage string `json:"err"`
	ErrCode    int    `json:"errCode"`
}

// User struct to store user data
type User struct {
	ID             int
	Name           string `json:"name"`
	Email          string `json:"email"`
	Password       string `json:"password"`
	ProfilePicture string `json:"profile_picture"`
}

//SaveToDB save user's data to database
func (user *User) SaveToDB(authTypeID int) (err error) {
	var stmt *sql.Stmt
	var bytesPassword []byte
	stmt, err = Db.Prepare("INSERT INTO user_account (name, email, password, auth_type_id) VALUES ($1, $2, $3, $4) RETURNING user_id")
	if err != nil {
		return
	}
	defer stmt.Close()
	bytesPassword, err = bcrypt.GenerateFromPassword([]byte(user.Password), 14)
	if err != nil {
		return
	}
	err = stmt.QueryRow(user.Name, user.Email, string(bytesPassword), authTypeID).Scan(&user.ID)
	if err != nil {
		return
	}
	return
}

// ValidateRegistration methods check if data provided by user are valid for
// registration
func (user *User) ValidateRegistration() (regErr RegistrationError, err error) {
	// check user name
	re := regexp.MustCompile("^[a-zA-Z][A-Za-z0-9_]*$")

	if ok := re.MatchString(user.Name); !ok || len(user.Name) < 3 {
		regErr.ErrCode = 1
		regErr.ErrMessage = "username must at least be 3 characteres long"
		err = errors.New(regErr.ErrMessage)
		return
	}

	// check user's email
	err = checkmail.ValidateFormat(user.Email)
	if err != nil {
		regErr.ErrCode = 2
		regErr.ErrMessage = err.Error()
		return
	}

	err = checkmail.ValidateHost(user.Email)
	if err != nil {
		regErr.ErrCode = 2
		regErr.ErrMessage = err.Error()
		return
	}

	// check user's password
	if len(user.Password) < 4 {
		regErr.ErrCode = 3
		regErr.ErrMessage = "invalid password"
		err = errors.New(regErr.ErrMessage)
		return
	}
	return
}

func newAccessToken() string {
	u4 := uuid.Must(uuid.NewV4())
	return u4.String()
}

func (user *User) CreateSession(c *context.Context) (err error) {
	var stmt *sql.Stmt
	stmt, err = Db.Prepare("INSERT INTO session (user_id, access_token) VALUES ($1, $2)")
	if err != nil {
		return
	}
	accessToken := newAccessToken()
	_, err = stmt.Exec(user.ID, accessToken)
	if err != nil {
		return
	}
	c.SetSecureCookie(CookieSecret, UserCookie, accessToken)
	return
}

func (user *User) Authenticate() (err error) {
	var dbUser User

	err = Db.QueryRow("SELECT user_id, email, password FROM user_account WHERE email=$1", user.Email).Scan(&dbUser.ID, &dbUser.Email, &dbUser.Password)
	if err != nil {
		return
	}
	err = bcrypt.CompareHashAndPassword([]byte(dbUser.Password), []byte(user.Password))
	if err != nil {
		return
	}
	user.ID = dbUser.ID
	return
}

func (user *User) GetData(accessToken string) (err error) {
	err = Db.QueryRow("SELECT user_id FROM session WHERE access_token=$1", accessToken).Scan(&user.ID)
	if err != nil {
		return
	}
	err = Db.QueryRow("SELECT name, email, profile_picture FROM user_account WHERE user_id=$1", user.ID).Scan(&user.Name, &user.Email, &user.ProfilePicture)
	if err != nil {
		return
	}
	return
}

func DestroySession(c *context.Context) {
	c.SetSecureCookie(CookieSecret, UserCookie, "")
}
