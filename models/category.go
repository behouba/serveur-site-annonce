package models

import (
	"database/sql"
	"fmt"
)

// Category struct represent each category element
type Category struct {
	ParentID      sql.NullInt64
	CategoryID    int
	Name          string
	PathName      string
	Fields        []sql.NullString
	SubCategories []Category
}

// CategoryMap map each category PathName with Name
var CategoryMap = make(map[string]string)

func getAllCategories() (categories []Category, err error) {
	var res *sql.Rows
	res, err = Db.Query("SELECT category_id, name, path_name FROM category WHERE parent_id is NULL ORDER BY name")

	if err != nil {
		fmt.Println(err)
		return
	}
	for res.Next() {
		cat := Category{}
		err := res.Scan(&cat.CategoryID, &cat.Name, &cat.PathName)
		if err != nil {
			fmt.Println(err)
		}
		CategoryMap[cat.PathName] = cat.Name
		if cat.CategoryID != 5 {
			cat.SubCategories, err = getCategories(cat.CategoryID)
		}
		if err != nil {
			fmt.Println(err)
		}
		categories = append(categories, cat)
	}

	return
}

func getCategories(id int) (categories []Category, err error) {
	var res *sql.Rows
	res, err = Db.Query("SELECT category_id, name, path_name FROM category WHERE parent_id=$1 ORDER BY category_id", id)
	if err != nil {
		return
	}
	for res.Next() {
		subCat := Category{}
		err := res.Scan(&subCat.CategoryID, &subCat.Name, &subCat.PathName)
		if err != nil {
			fmt.Println(err)
		}
		CategoryMap[subCat.PathName] = subCat.Name
		categories = append(categories, subCat)
	}
	return
}
