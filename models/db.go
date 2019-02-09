package models

import (
	"database/sql"
	"fmt"

	"github.com/astaxie/beego"
	_ "github.com/lib/pq" // postgresql driver
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

	cid := OauthCredentiel{CID: googleClientID, CSecret: googleClientSecret}
	fmt.Println(cid)
}
