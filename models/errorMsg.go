package models

const (
	titleTooShortErr      = "The title of an advert must be at least %d characteres"
	titleTooLongErr       = "The title of an advert must be less than %d characteres"
	descTooLongErr        = "The description of an advert must be less than %d characteres"
	priceTooMuchErr       = "Current the price on an advert must bee less than %d"
	picturesURLTooMuchErr = "Advert must have no more than %d pictures"
)

type JSONRespErr struct {
	Code    int    `json:"code"`
	Message string `json:"message"`
}
