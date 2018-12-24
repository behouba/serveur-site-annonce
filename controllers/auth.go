package controllers

import (
	"encoding/json"
	"fmt"
	"serveur/models"
)

// Post EmailRegistration handle post request for new user
// email registration
func (c *EmailRegistration) Post() {
	var user models.User
	err := json.Unmarshal(c.Ctx.Input.RequestBody, &user)
	if err != nil {
		fmt.Println(err)
	}

	registrationError, err := user.ValidateRegistration()
	if err != nil {
		fmt.Println(err)
		c.Ctx.Output.SetStatus(400)
		c.Data["json"] = registrationError
		c.ServeJSON()
		return
	}

	if err := user.SaveToDB(1); err != nil {
		fmt.Println(err)
		if err.Error() == "pq: duplicate key value violates unique constraint \"user_account_email_key\"" {
			c.Ctx.Output.SetStatus(409)
		} else {
			c.Ctx.Output.SetStatus(500)
		}
		return
	}

	err = user.CreateSession(c.Ctx.Input.Context)
	if err != nil {
		fmt.Println(err)
		c.Ctx.Output.SetStatus(500)
		return
	}
	c.Data["json"] = user
	c.ServeJSON()
}

//

func (c *EmailLoginController) Post() {
	var user models.User
	err := json.Unmarshal(c.Ctx.Input.RequestBody, &user)
	if err != nil {
		fmt.Println(err)
		c.Ctx.Output.SetStatus(401)
		return
	}

	err = user.Authenticate()
	if err != nil {
		fmt.Println(err)
		c.Ctx.Output.SetStatus(401)
		return
	}

	err = user.CreateSession(c.Ctx.Input.Context)
	if err != nil {
		fmt.Println(err)
		c.Ctx.Output.SetStatus(500)
		return
	}
	c.Data["json"] = user
	c.ServeJSON()
}

func (c *LogoutController) Delete() {
	// c.SetSecureCookie(cookieSecret, cookieName, "")
	c.Finish()
}
