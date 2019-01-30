package models

const (
	rs4SaleID  = 67
	rs4RentID  = 68
	rsSearchID = 69
)

type AllAttributes struct {
	CarBrands      []Brand      `json:"carBrands"`
	Years          []Year       `json:"years"`
	FashionGenders []Gender     `json:"fashionGenders"`
	ShoeSizes      []ShoeSize   `json:"shoeSizes"`
	JobFields      []Field      `json:"jobFields"`
	RealEstates    []RealEstate `json:"realEstates"`
}

type Brand struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type Year struct {
	ID    int `json:"id"`
	Value int `json:"value"`
}

type Gender struct {
	ID            int            `json:"id"`
	Name          string         `json:"name"`
	ClothingTypes []ClothingType `json:"clothingTypes"`
	Sizes         []Size         `json:"sizes"`
}

type ClothingType struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}
type Size struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type ShoeSize struct {
	ID    int `json:"id"`
	Value int `json:"value"`
}

type Field struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

type RealEstate struct {
	CategoryID int              `json:"id"`
	Types      []RealEstateType `json:"types"`
}

type RealEstateType struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}
