package models

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/lib/pq"
)

const (
	minTitleLength       = 2
	maxTitleLength       = 50
	maxDescriptionLength = 4000
	maxPrice             = 10000000000
	maxPicturesURL       = 4

	defaultPicture = "http://localhost:8080/files/assets/empty-photo.svg"

	timeFormat = "%d %s, %s"

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
	Price       int64           `json:"price"`
	PicturesURL []Picture       `json:"picturesURL"`
	CityID      int             `json:"cityId"`
	PhoneNumber string          `json:"phoneNumber"`
	CreatedAt   time.Time       `json:"createdAt"`
}

type AdvertItem struct {
	Title          string   `json:"title"`
	Price          int64    `json:"price"`
	FormattedPrice string   `json:"formattedPrice"`
	ThumbnailsURLs []string `json:"ThumbnailsURLs"`
	CityName       string   `json:"cityName"`
	FormattedTime  string   `json:"formattedTime"`
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

	if (a.TypeID == 2 || a.TypeID == 4) && a.Price != 0 {
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
		advert_type_id, price, attribute,  pictures_urls, thumbnails_urls) 
		VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) returning advert_id;`)
	if err != err {
		return
	}

	var thumbnailsURLs []string
	for _, tURL := range a.PicturesURL {
		thumbnailsURLs = append(thumbnailsURLs, tURL.ThumbnailURL)
	}

	picturesURL, err := json.Marshal(a.PicturesURL)
	if err != nil {
		return
	}

	err = stmt.QueryRow(a.Title, a.Description, a.UserID, a.CategoryID, a.CityID, advertOnlineState, a.TypeID, a.Price, a.Attributes, picturesURL, pq.Array(thumbnailsURLs)).Scan(&a.ID)
	if err != nil {
		return
	}
	return
}

// GetFormContent retrive advert form field objet from database
func GetFormContent() (rawJSON json.RawMessage, err error) {
	err = Db.QueryRow("SELECT content FROM form_field WHERE form_field_id=$1", 1).Scan(&rawJSON)
	if err != nil {
		return
	}
	return
}

func GetAdvertsItems() (items []AdvertItem, err error) {

	rows, err := Db.Query("SELECT title, price, created_at, city_name, thumbnails_urls FROM advert INNER JOIN city ON advert.city_id=city.city_id;")
	if err != nil {
		return
	}

	now := time.Now()

	for rows.Next() {
		var item AdvertItem
		var createTime time.Time

		err := rows.Scan(&item.Title, &item.Price, &createTime, &item.CityName, pq.Array(&item.ThumbnailsURLs))
		if err != nil {
			log.Println(err)
			continue
		}
		if len(item.ThumbnailsURLs) == 0 {
			item.ThumbnailsURLs = append(item.ThumbnailsURLs, defaultPicture)
		}
		if item.Price != 0 {
			item.FormattedPrice = formatPrice(item.Price)
		}
		item.FormattedTime = formatTimeFR(&createTime, &now)
		items = append(items, item)
	}
	return
}

// formatTimeFR function take a pointer to advert item Time and pointer to current Time then
// convert given time into french '03 Decembre, 09:15' like format
func formatTimeFR(t, n *time.Time) string {
	timeString := strings.Join(strings.Split(fmt.Sprintf(t.Format("15:04:05")), ":")[:2], ":")

	if n.Day() == t.Day() && n.Month() == t.Month() && n.Year() == t.Year() {
		return fmt.Sprintf("Aujourd'hui, %s", timeString)
	}

	var month string
	switch t.Month().String() {
	case "January":
		month = "Janvier"
	case "February":
		month = "Février"
	case "March":
		month = "Mars"
	case "April":
		month = "Avril"
	case "May":
		month = "Mai"
	case "June":
		month = "Juin"
	case "July":
		month = "Juillet"
	case "August":
		month = "Août"
	case "September":
		month = "Septembre"
	case "October":
		month = "Octobre"
	case "November":
		month = "Novembre"
	case "December":
		month = "Décembre"
	}
	return fmt.Sprintf(timeFormat, t.Day(), month, timeString)
}

//
func formatPrice(n int64) string {
	in := strconv.FormatInt(n, 10)
	out := make([]byte, len(in)+(len(in)-2+int(in[0]/'0'))/3)
	if in[0] == '-' {
		in, out[0] = in[1:], '-'
	}

	for i, j, k := len(in)-1, len(out)-1, 0; ; i, j = i-1, j-1 {
		out[j] = in[i]
		if i == 0 {
			return string(out)
		}
		if k++; k == 3 {
			j, k = j-1, 0
			out[j] = ','
		}
	}
}
