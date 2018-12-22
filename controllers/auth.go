package controllers

import (
	"encoding/json"
	"fmt"
	"serveur/models"
)

func (c *EmailRegistration) Post() {
	var user models.User
	err := json.Unmarshal(c.Ctx.Input.RequestBody, &user)
	if err != nil {
		fmt.Println(err)
	}
	err = models.ValidateEmailRegistration(user)
	if err != nil {
		c.Ctx.Output.SetStatus(400)
	}
	fmt.Println(user)
	c.Data["json"] = user
	c.ServeJSON()
}
