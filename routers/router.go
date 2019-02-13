package routers

import (
	"serveur/controllers"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/plugins/cors"
)

func init() {

	// regulars routes
	beego.Router("/", &controllers.MainController{})
	beego.Router("/:fPath:string/", &controllers.FPathController{})
	beego.Router("/:city:string/:category:string/", &controllers.CategoryControler{})
	beego.Router("/ad/:id:int/", &controllers.AdvertControler{})
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

	// new advert creation routes
	beego.Router("/create/", &controllers.Create{})

	//authentification
	beego.Router("/auth/registration", &controllers.Registration{})

	// upload files
	beego.Router("/upload/", &controllers.UploadController{})
	// api's routes
	beego.Router("/api/cities", &controllers.FetchCities{})
	beego.Router("/api/categories/?:id", &controllers.FetchCategoryController{})
	beego.Router("/api/form/json_content", &controllers.CategoryFormController{})
	beego.Router("/api/form/json_content", &controllers.CategoryFormController{})
	beego.Router("/api/form/attr", &controllers.AttributesController{})

	// authentification api routes
	// beego.Router("/api/auth/email_reg", &controllers.EmailRegistration{})
	beego.Router("/api/auth", &controllers.EmailAuthController{})
	beego.Router("/auth/oauth", &controllers.GoogleAuth2Controller{})
	beego.Router("/api/auth2/facebook", &controllers.FbkAuth2Controller{})
	beego.Router("/api/auth/logout", &controllers.LogoutController{})

	// filters
	beego.InsertFilter("/*", beego.BeforeRouter, golabalFilter)
	beego.InsertFilter("/profile/*", beego.BeforeRouter, profileFilter)
	// beego.InsertFilter("/create", beego.BeforeRouter, profileFilter)
	beego.InsertFilter("/upload/*", beego.BeforeRouter, cors.Allow(&cors.Options{
		AllowOrigins:     []string{"http://127.0.0.1:5500"},
		AllowMethods:     []string{"PUT", "PATCH", "POST", "DELETE"},
		AllowHeaders:     []string{"Origin"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))

	// set path to static images files
	beego.SetStaticPath("/files", "files")
}
