package models

import "encoding/json"

func GetFormState(id int) (rawJSON json.RawMessage, err error) {
	var formID int
	err = Db.QueryRow("SELECT form_id FROM category WHERE category_id=$1", id).Scan(&formID)
	if err != nil {
		return
	}
	err = Db.QueryRow("SELECT form_state FROM form WHERE form_id=$1", formID).Scan(&rawJSON)
	if err !=nil {
		return
	}
	return
}
