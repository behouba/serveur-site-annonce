package controllers

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"serveur/models"

	"github.com/astaxie/beego"
)

type Registration struct {
	beego.Controller
}

type GoogleAuth2Controller struct {
	beego.Controller
}
type FbkAuth2Controller struct {
	beego.Controller
}

//
func (c *Registration) Get() {
	c.TplName = "desktop/registration.html"
}

func (c *Registration) Post() {

}

// Post EmailRegistration handle post request for new user
// email registration
func (c *EmailAuthController) Post() {
	var user models.UserData
	err := json.Unmarshal(c.Ctx.Input.RequestBody, &user)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(user)

	err = user.EmailAuth(c.Ctx.Input.Context)
	if err != nil {
		fmt.Println(err)
		c.Data["json"] = struct {
			Error string `json:"error"`
		}{err.Error()}
		c.ServeJSON()
		return
	}

	c.Data["json"] = user
	c.ServeJSON()
}

// Delete handler for when user send request to logout
func (c *LogoutController) Delete() {
	models.DestroySession(c.Ctx.Input.Context)
	c.Redirect("/", http.StatusSeeOther)
}

func (c *GoogleAuth2Controller) Get() {
	state := c.Ctx.GetCookie("state")

	if state != c.GetString("state") {
		fmt.Println(c.GetString("state"))
		c.Ctx.Abort(http.StatusUnauthorized, fmt.Sprintf("Invalid session state: %s", state))
		return
	}

	user, err := models.GetGoogleUserData(c.GetString("code"))
	if err != nil {
		c.Ctx.Abort(http.StatusInternalServerError, err.Error())
		return
	}
	log.Println("google user data = ", user.AuthTypeID)

	err = user.Oauth2Login(c.Ctx.Input.Context)
	if err != nil {
		fmt.Println(err)
		c.Ctx.Output.SetStatus(400)
		c.Data["json"] = struct {
			Error string `json:"error"`
		}{err.Error()}
		c.ServeJSON()
		return
	}
	c.Redirect("/", http.StatusTemporaryRedirect)
}

func (c *FbkAuth2Controller) Get() {
	state := c.Ctx.GetCookie("state")

	if state != c.GetString("state") {
		fmt.Println(c.GetString("state"))
		c.Ctx.Abort(http.StatusUnauthorized, fmt.Sprintf("Invalid session state: %s", state))
		return
	}

	user, err := models.GetFbkUserData(c.GetString("code"))
	if err != nil {
		log.Println(err)
		return
	}
	err = user.Oauth2Login(c.Ctx.Input.Context)
	if err != nil {
		fmt.Println(err)
		c.Ctx.Output.SetStatus(400)
		c.Data["json"] = struct {
			Error string `json:"error"`
		}{err.Error()}
		c.ServeJSON()
		return
	}
	c.Redirect("/", http.StatusTemporaryRedirect)

}
