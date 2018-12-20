package models

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq" // postgresql driver
)

const (
	host     = "localhost"
	port     = 5432
	user     = "postgres"
	password = "mana"
	dbname   = "site_annonce"
)

// Db is a pointer to database connexion object
var Db *sql.DB

// Categories slice of all categories from database
var Categories []Category

// Cities slice of all cities from database
var Cities []city

// CityMap map each city path with city name
var CitiesMap = make(map[string]string)

func init() {
	var err error
	dbConnInfo := fmt.Sprintf("host=%s port=%d user=%s "+"password=%s dbname=%s sslmode=disable", host, port, user, password, dbname)
	Db, err = sql.Open("postgres", dbConnInfo)
	if err != nil {
		panic(err)
	}
	Categories, err = getCategories()
	if err != nil {
		panic(err)
	}
	Cities, err = getCities()
	if err != nil {
		panic(err)
	}
}
