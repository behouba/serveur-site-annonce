package models

import (
	"database/sql"
	"fmt"

	"github.com/astaxie/beego"
	_ "github.com/lib/pq" // postgresql driver
	"golang.org/x/oauth2"
	"golang.org/x/oauth2/google"
)

var (
	googleClientID     = beego.AppConfig.String("googleClientID")
	googleClientSecret = beego.AppConfig.String("googleClientSecret")

	CookieSecret = beego.AppConfig.String("secret")
	UserCookie   = "__connexion"
	GuestCookie  = "__guest"
	host         = beego.AppConfig.String("dbhost")
	port         = 5432
	user         = beego.AppConfig.String("dbuser")
	password     = beego.AppConfig.String("dbpassword")
	dbname       = beego.AppConfig.String("dbname")
)

// Db is a pointer to database connexion object
var Db *sql.DB

// Categories slice of all categories from database
var Categories []Category

// Cities slice of all cities from database
var Cities []city

// CitiesMap map each city path with city name
var CitiesMap = make(map[string]string)

// Attributes data structure
var Attributes *AllAttributes

// Oauth config

var oauth2Config Oauth2Config

func init() {
	var err error
	dbConnInfo := fmt.Sprintf("host=%s port=%d user=%s "+"password=%s dbname=%s sslmode=disable", host, port, user, password, dbname)
	Db, err = sql.Open("postgres", dbConnInfo)
	if err != nil {
		fmt.Println(err)
		panic(err)
	}
	Categories, err = getAllCategories()
	if err != nil {
		fmt.Println(err)
		panic(err)
	}
	Cities, err = getCities()
	if err != nil {
		panic(err)
	}
	Attributes, err = GetAllAttributes()
	if err != nil {
		panic(err)
	}
	oauth2Config, err = initOauthConfig()
	if err != nil {
		panic(err)
	}
}

func initOauthConfig() (oauth2Config Oauth2Config, err error) {
	oauth2Config.Google = &oauth2.Config{
		ClientID:     googleClientID,
		ClientSecret: googleClientSecret,
		RedirectURL:  "http://localhost:8080/auth/oauth",
		Scopes: []string{
			"https://www.googleapis.com/auth/userinfo.email", // You have to select your own scope from here -> https://developers.google.com/identity/protocols/googlescopes#google_sign-in
		},
		Endpoint: google.Endpoint,
	}

	return
}
