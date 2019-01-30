package routers

import (
	"fmt"
	"net/http"
	"serveur/models"

	"github.com/astaxie/beego/context"
	_ "github.com/mssola/user_agent" // will be used to check if request come from mobile device or not
)

func golabalFilter(ctx *context.Context) {
	// ua := user_agent.New(ctx.Input.UserAgent())

	// fmt.Println("this request come from a mobile device :", ua.Mobile())
	ctx.Input.SetData("CityName", "Choisissez votre localité")
	ctx.Input.SetData("Category", "CATEGORIES")
	ctx.Input.SetData("Categories", models.Categories)
	ctx.Input.SetData("CityPath", "all")
	userCookieValue, ok := ctx.GetSecureCookie(models.CookieSecret, models.UserCookie)
	user := models.User{}
	if err := user.GetData(userCookieValue); err != nil || !ok {
		fmt.Println("cookie is not valid", err)
	} else {
		ctx.Input.SetData("User", user)
		fmt.Println("user is logged in")
	}
}

func profileFilter(ctx *context.Context) {
	user := ctx.Input.GetData("User")
	if user == nil {
		ctx.Output.SetStatus(http.StatusForbidden)
		ctx.Redirect(401, "/")
	}
}
