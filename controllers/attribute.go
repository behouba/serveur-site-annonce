package controllers

import (
	"serveur/models"

	"github.com/astaxie/beego"
)

type AttributesController struct {
	beego.Controller
}

func (c *AttributesController) Get() {
	c.Data["json"] = *models.Attributes
	c.ServeJSON()
}
