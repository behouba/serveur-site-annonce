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
	// beego.Router("/:city:string/:category:string/:subcategory:string", &controllers.SubCategoryControler{})



	// api's routes
	beego.Router("/api/cities", &controllers.FetchCities{})

	// authentification api routes
	beego.Router("/api/auth/email", &controllers.EmailRegistration{})
}
