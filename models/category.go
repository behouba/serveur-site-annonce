package models

import (
	"database/sql"
	"fmt"
)

// Category struct represent each category element
type Category struct {
	ParentID      sql.NullInt64    `json:"parent_id"`
	CategoryID    int              `json:"id"`
	Name          string           `json:"name"`
	PathName      string           `json:"path_name"`
	Fields        []sql.NullString `json:"fields"`
	SubCategories []Category       `json:"sub_categories"`
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
			cat.SubCategories, err = GetCategories(cat.CategoryID)
		}
		if err != nil {
			fmt.Println(err)
		}
		categories = append(categories, cat)
	}

	return
}

func GetCategories(id int) (categories []Category, err error) {
	var res *sql.Rows
	res, err = Db.Query("SELECT category_id, name, path_name, parent_id FROM category WHERE parent_id=$1 ORDER BY category_id", id)
	if err != nil {
		return
	}
	for res.Next() {
		subCat := Category{}
		err := res.Scan(&subCat.CategoryID, &subCat.Name, &subCat.PathName, &subCat.ParentID)
		if err != nil {
			fmt.Println(err)
		}
		CategoryMap[subCat.PathName] = subCat.Name
		categories = append(categories, subCat)
	}
	return
}
