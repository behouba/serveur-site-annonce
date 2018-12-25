package routers

import (
	"fmt"
	"serveur/models"

	"github.com/astaxie/beego/context"
)

func golabalFilter(ctx *context.Context) {
	ctx.Input.SetData("Categories", models.Categories)

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
		ctx.Output.SetStatus(403)
	}
}
