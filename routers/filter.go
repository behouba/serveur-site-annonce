package routers

import (
	"fmt"
	"serveur/models"

	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context"
)

var (
	cookieSecret = beego.AppConfig.String("secret")
	cookieName   = "__connexion"
)

func GolabalFilter(ctx *context.Context) {
	cookieValue, ok := ctx.GetSecureCookie(cookieSecret, cookieName)

	ctx.Input.SetData("Categories", models.Categories)

	user := models.User{}
	if err := user.GetData(cookieValue); err != nil || !ok {
		fmt.Println("cookie is not valid", err)
	} else {
		ctx.Input.SetData("User", user)
		fmt.Println("user is logged in")
	}
}
