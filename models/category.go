package models

import (
	"database/sql"
	"fmt"
)

type Category struct {
	ParentID      sql.NullInt64
	CategoryID    int
	Name          string
	Fields        []sql.NullString
	SubCategories []Category
}

func getCategories() (categories []Category, err error) {
	var res *sql.Rows

	res, err = Db.Query("SELECT category_id, name FROM category WHERE parent_id is NULL ORDER BY name")

	if err != nil {
		fmt.Println(err)
		return
	}
	for res.Next() {
		cat := Category{}
		err := res.Scan(&cat.CategoryID, &cat.Name)
		if err != nil {
			fmt.Println(err)
		}
		if cat.CategoryID != 5 {
			cat.SubCategories, err = getSubCategories(cat.CategoryID)
		}
		if err != nil {
			fmt.Println(err)
		}
		categories = append(categories, cat)
	}

	return
}

func getSubCategories(id int) (categories []Category, err error) {
	var res *sql.Rows
	res, err = Db.Query("SELECT category_id, name FROM category WHERE parent_id=$1 ORDER BY category_id", id)
	if err != nil {
		return
	}
	for res.Next() {
		subCat := Category{}
		err := res.Scan(&subCat.CategoryID, &subCat.Name)
		if err != nil {
			fmt.Println(err)
		}
		categories = append(categories, subCat)
	}
	return
}
