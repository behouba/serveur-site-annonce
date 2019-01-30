package models

import "log"

func GetAllAttributes() (*AllAttributes, error) {
	var attr AllAttributes
	var err error
	attr.Years, err = getYears()
	if err != nil {
		return &attr, err
	}

	attr.CarBrands, err = getCarBrands()
	if err != nil {
		return &attr, err
	}

	fg, err := Db.Query("SELECT gender_id, gender_name FROM fashion_gender")
	if err != nil {
		return &attr, err
	}

	for fg.Next() {
		var g Gender
		err := fg.Scan(&g.ID, &g.Name)
		if err != nil {
			log.Println(err)
			continue
		}
		g.Sizes, err = getClothingSizes(g.ID)
		if err != nil {
			log.Println(err)
			continue
		}
		g.ClothingTypes, err = getClothingTypes(g.ID)
		if err != nil {
			log.Println(err)
			continue
		}
		attr.FashionGenders = append(attr.FashionGenders, g)
	}

	attr.ShoeSizes, err = getShoeSizes()
	if err != nil {
		return &attr, err
	}

	attr.JobFields, err = getJobFields()
	if err != nil {
		return &attr, err
	}

	attr.RealEstates, err = getRealEstateTypes()
	if err != nil {
		return &attr, err
	}
	return &attr, nil
}

func getRealEstateTypes() (rsTypes []RealEstate, err error) {
	var rsIDs = []int{rs4SaleID, rs4RentID, rsSearchID}

	for _, id := range rsIDs {
		var r RealEstate
		r.CategoryID = id
		rs, err := Db.Query("SELECT type_id, name FROM real_estate_type WHERE category_id=$1", id)
		if err != nil {
			return nil, err
		}
		for rs.Next() {
			var t RealEstateType
			err := rs.Scan(&t.ID, &t.Name)
			if err != nil {
				log.Println(err)
				continue
			}
			r.Types = append(r.Types, t)
		}
		rsTypes = append(rsTypes, r)
	}
	return
}

func getJobFields() (fiels []Field, err error) {
	sf, err := Db.Query("SELECT field_id, field_name FROM job_field ORDER BY field_name")
	if err != nil {
		return
	}
	for sf.Next() {
		var f Field
		err := sf.Scan(&f.ID, &f.Name)
		if err != nil {
			log.Println(err)
			continue
		}
		fiels = append(fiels, f)
	}
	return
}

func getYears() (years []Year, err error) {
	yearRows, err := Db.Query("SELECT car_year_id, year FROM year ORDER BY year DESC")
	if err != nil {
		return
	}
	for yearRows.Next() {
		var y Year
		err := yearRows.Scan(&y.ID, &y.Value)
		if err != nil {
			log.Println(err)
			continue
		}
		years = append(years, y)
	}
	return
}

func getCarBrands() (brands []Brand, err error) {
	br, err := Db.Query("SELECT car_brand_id, brand_name FROM car_brand ORDER BY brand_name")
	if err != nil {
		return
	}
	for br.Next() {
		var b Brand
		err := br.Scan(&b.ID, &b.Name)
		if err != nil {
			log.Println(err)
			continue
		}
		brands = append(brands, b)
	}
	return
}

func getClothingSizes(genderID int) (sizes []Size, err error) {
	rows, err := Db.Query("SELECT size_id, size_name FROM clothing_size WHERE fashion_gender_id=$1;", genderID)
	if err != nil {
		return
	}
	for rows.Next() {
		var s Size
		err := rows.Scan(&s.ID, &s.Name)
		if err != nil {
			log.Println(err)
			continue
		}
		sizes = append(sizes, s)
	}
	return
}
func getClothingTypes(genderID int) (types []ClothingType, err error) {
	rows, err := Db.Query("SELECT clothing_type_id, clothing_name FROM clothing_type WHERE gender_id=$1;", genderID)
	if err != nil {
		return
	}
	for rows.Next() {
		var t ClothingType
		err := rows.Scan(&t.ID, &t.Name)
		if err != nil {
			log.Println(err)
			continue
		}
		types = append(types, t)
	}
	return
}

func getShoeSizes() (shoesSizes []ShoeSize, err error) {
	rows, err := Db.Query("SELECT size_id, size_value FROM shoe_size;")
	if err != nil {
		return
	}
	for rows.Next() {
		var s ShoeSize
		err := rows.Scan(&s.ID, &s.Value)
		if err != nil {
			log.Println(err)
			continue
		}
		shoesSizes = append(shoesSizes, s)
	}
	return
}
