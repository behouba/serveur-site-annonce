package models

const (

	// advert types constants
	sellingTypeID    = 1
	searchTypeID     = 2
	trocTypeID       = 3
	giftTypeID       = 4
	serviceTypeID    = 5
	jobTypeID        = 6
	eventTypeID      = 7
	realEstateTypeID = 8

	// categories id constants
	carCategoryID      = 19
	motoCategoryID     = 20
	clothingCategoryID = 30
	shoeCategoryID     = 31
	// fashionCategoryID1 = 32
	// fashionCategoryID2 = 33
	// fashionCategoryID3 = 34
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

// single ad types property

type vehiculeAttribute struct {
	YearID  int `json:"yearId"`
	Mileage int `json:"mileage"`
}

type carAttribute struct {
	vehiculeAttribute
	BrandID int `json:"brandId"`
}

type fashionAttribute struct {
	GenderID int `json:"genderId"`
}

type clothingAttribute struct {
	fashionAttribute
	ClothingTypeID int `json:"clothingTypeId"`
	ClothingSizeID int `json:"clothingSizeId"`
}

type shoeAttribute struct {
	fashionAttribute
	ShoeSizeID int `json:"shoeSizeId"`
}

type realEstateAttribute struct {
	RealEstateTypeId int `json:"realEstateTypeId"`
}

type jobAttribute struct {
	JobFieldID int `json:"jobFieldId"`
}
