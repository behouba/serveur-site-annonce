package models

import (
	"encoding/json"
	"fmt"
	"net/http"
	"time"
)

const (
	minTitleLength       = 2
	maxTitleLength       = 50
	maxDescriptionLength = 4000
	maxPrice             = 10000000000
	maxPicturesURL       = 4

	advertOnlineState  = 1 // state of advert that is alive and is displayed on listing
	advertOffLineState = 2 // state of advert that is not deleted but is not displayed on listing
	advertDeletedState = 3 // state of advert that is deleted eather owner or guess users can not see it
)

// Advert type is a representation of advert created by users
type Advert struct {
	ID          int             `json:"advert_id"`
	UserID      int             `json:"userId"`
	Title       string          `json:"title"`
	CategoryID  int             `json:"categoryId"`
	TypeID      int             `json:"typeId"`
	Attributes  json.RawMessage `json:"attributes"`
	Description string          `json:"description"`
	Price       int             `json:"price"`
	PicturesURL []Picture       `json:"picturesURL"`
	CityID      int             `json:"cityId"`
	PhoneNumber string          `json:"phoneNumber"`
	CreatedAt   time.Time       `json:"createdAt"`
}

// GetFormContent retrive advert form field objet from database
func GetFormContent() (rawJSON json.RawMessage, err error) {
	err = Db.QueryRow("SELECT content FROM form_field WHERE form_field_id=$1", 1).Scan(&rawJSON)
	if err != nil {
		return
	}
	return
}

// Validate methode of Advert struct check
// and validate advert content
func (a *Advert) Validate() (err JSONRespErr) {
	err.Code = http.StatusBadRequest
	if len(a.Title) > maxTitleLength {
		err.Message = fmt.Sprintf(titleTooLongErr, maxTitleLength)
		return
	} else if len(a.Title) < minTitleLength {
		err.Message = fmt.Sprintf(titleTooShortErr, minTitleLength)
		return
	}

	if len(a.Description) > maxDescriptionLength {
		err.Message = fmt.Sprintf(descTooLongErr, maxDescriptionLength)
		return
	}
	if a.Price > maxPrice {
		err.Message = fmt.Sprintf(priceTooMuchErr, maxPrice)
		return
	}
	if len(a.PicturesURL) > maxPicturesURL {
		err.Message = fmt.Sprintf(picturesURLTooMuchErr, maxPicturesURL)
		return
	}
	err.Code = http.StatusOK
	return
}

// Save methode store advert to database
func (a *Advert) Save() (err error) {
	stmt, err := Db.Prepare(
		`INSERT INTO advert 
		(title, description , advertiser_id, category_id, city_id, advert_state_id,
		advert_type_id, price, attribute,  pictures_urls) 
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) returning advert_id;`)
	if err != err {
		return
	}
	picturesURL, err := json.Marshal(a.PicturesURL)
	if err != nil {
		return
	}
	err = stmt.QueryRow(a.Title, a.Description, a.UserID, a.CategoryID, a.CityID, advertOnlineState, a.TypeID, a.Price, a.Attributes, picturesURL).Scan(&a.ID)
	if err != nil {
		return
	}
	return
}
