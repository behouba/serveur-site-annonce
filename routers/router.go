package routers

import (
	"serveur/controllers"

	"github.com/astaxie/beego"
)

func init() {

	// regulars routes
	beego.Router("/", &controllers.MainController{})
	beego.Router("/:city:string/", &controllers.CityControler{})
	beego.Router("/:city:string/:category:string/", &controllers.CategoryControler{})
	beego.Router("/:city:string/:category:string/:id:int/", &controllers.AdvertControler{})
	// profile
	beego.Router("/profile/", &controllers.ProfileControler{})
	beego.Router("/profile/favoris/", &controllers.ProfileFavoritesControler{})
	beego.Router("/profile/messenger/", &controllers.ProfileMessengerControler{})
	beego.Router("/profile/settings/", &controllers.ProfileSettingsControler{})
	beego.Router("/profile/alerts/", &controllers.ProfileAlertsControler{})
	// user (advertiser)
	beego.Router("/advertiser/:id:string/", &controllers.AdvertiserControler{})

	// new advert creation route
	beego.Router("/create/", &controllers.CreateAdvertControler{})

	// api's routes
	beego.Router("/api/cities", &controllers.FetchCities{})
	beego.Router("/api/categories/?:id", &controllers.FetchCategoryController{})

	// authentification api routes
	beego.Router("/api/auth/email_reg", &controllers.EmailRegistration{})
	beego.Router("/api/auth/email_login", &controllers.EmailLoginController{})
	beego.Router("/api/auth/logout", &controllers.LogoutController{})

	// filters
	beego.InsertFilter("/*", beego.BeforeRouter, golabalFilter)
	beego.InsertFilter("/profile/*", beego.BeforeRouter, profileFilter)
}
