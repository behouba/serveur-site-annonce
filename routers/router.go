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
	beego.Router("/profile/:id:int", &controllers.ProfileControler{})
	beego.Router("/profile/:id:int/favoris/", &controllers.ProfileFavoritesControler{})
	beego.Router("/profile/:id:int/messenger/", &controllers.ProfileMessengerControler{})
	beego.Router("/profile/:id:int/settings/", &controllers.ProfileSettingsControler{})

	// api's routes
	beego.Router("/api/cities", &controllers.FetchCities{})

	// authentification api routes
	beego.Router("/api/auth/email_reg", &controllers.EmailRegistration{})
	beego.Router("/api/auth/email_login", &controllers.EmailLoginController{})
	beego.Router("/api/auth/logout", &controllers.LogoutController{})

	// filters
	beego.InsertFilter("/*", beego.BeforeRouter, golabalFilter)
	beego.InsertFilter("/profile/*", beego.BeforeRouter, profileFilter)
}
