package controllers

import (
	"serveur/models"
)

func (c *MainController) Get() {
	c.Data["City"] = "Choisissez votre localité"
	c.Data["Categories"] = models.Categories
	c.TplName = "desktop/home.html"
}

func (c *FirstPathControler) Get() {
	city := models.CitiesMap[c.Ctx.Input.Param(":fPath")]
	if city == "" {
		c.Abort("404")
	}
	c.Data["City"] = city
	c.Data["Categories"] = models.Categories
	c.TplName = "desktop/home.html"
}

func (c *FetchCities) Get() {
	c.Data["json"] = models.Cities
	c.ServeJSON()
	c.StopRun()
}
