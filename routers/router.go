package routers

import (
	"serveur/controllers"

	"github.com/astaxie/beego"
)

func init() {

	// regulars routes
	beego.Router("/", &controllers.MainController{})
	beego.Router("/:fPath:string/", &controllers.FPathController{})
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

	// chat
	beego.Router("/im/ad/:id:string/", &controllers.ChatRoomController{})

	// store
	beego.Router("/boutiques/", &controllers.StoresListController{})
	beego.Router("/store/actives", &controllers.StoreOnControler{})
	beego.Router("/store/inactives", &controllers.StoreOffControler{})
	beego.Router("/store/favoris", &controllers.StoreFavoritesControler{})
	beego.Router("/store/messenger", &controllers.StoreMessengerControler{})
	beego.Router("/store/settings", &controllers.StoreSettingsControler{})
	beego.Router("/store/stats", &controllers.StoreStatsControler{})

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
