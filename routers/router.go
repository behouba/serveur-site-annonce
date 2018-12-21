package routers

import (
	"serveur/controllers"

	"github.com/astaxie/beego"
)

func init() {
	// regulars routes
	beego.Router("/", &controllers.MainController{})
	beego.Router("/:fPath:string", &controllers.FirstPathControler{})

	// api's routes
	beego.Router("/api/cities", &controllers.FetchCities{})
}
