package models

import (
	"database/sql"
)

type city struct {
	CityID   int
	Name     string `json:"name"`
	PathName string `json:"value"`
}

func getCities() (cities []city, err error) {
	var rows *sql.Rows
	rows, err = Db.Query("SELECT name, path_name, city_id FROM city")
	if err != nil {
		return
	}

	for rows.Next() {
		var c city
		rows.Scan(&c.Name, &c.PathName, &c.CityID)
		CitiesMap[c.PathName] = c.Name
		cities = append(cities, c)
	}
	return
}
