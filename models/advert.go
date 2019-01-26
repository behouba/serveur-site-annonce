package models

import "encoding/json"

func GetFormContent() (rawJSON json.RawMessage, err error) {
	err = Db.QueryRow("SELECT content FROM form_field WHERE form_field_id=$1", 1).Scan(&rawJSON)
	if err != nil {
		return
	}
	return
}
