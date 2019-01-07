package models

type Store struct {
	Name string
}

func GetStore(path string) (s Store, err error) {
	err = Db.QueryRow("SELECT brand_name FROM store WHERE store_path=$1", path).Scan(&s.Name)
	if err != nil {
		return
	}
	return
}
