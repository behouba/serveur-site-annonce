package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

type CityControler struct {
	beego.Controller
}

type FetchCities struct {
	beego.Controller
}

type CategoryControler struct {
	beego.Controller
}

type SubCategoryControler struct {
	beego.Controller
}

type EmailRegistration struct {
	beego.Controller
}

type EmailLoginController struct {
	beego.Controller
}

type LogoutController struct {
	beego.Controller
}

type ProfileControler struct {
	beego.Controller
}

type ProfileFavoritesControler struct {
	beego.Controller
}

type ProfileMessengerControler struct {
	beego.Controller
}

type ProfileSettingsControler struct {
	beego.Controller
}

type AdvertControler struct {
	beego.Controller
}

type ProfileAlertsControler struct {
	beego.Controller
}

type AdvertiserControler struct {
	beego.Controller
}

type CreateAdvertControler struct {
	beego.Controller
}

type FetchCategoryController struct {
	beego.Controller
}
