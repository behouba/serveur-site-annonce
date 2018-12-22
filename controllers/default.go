package controllers

import (
	"serveur/models"
)

func (c *MainController) Get() {
	c.Data["CityName"] = "Choisissez votre localité"
	c.Data["CityPath"] = "civ"
	c.Data["Categories"] = models.Categories
	c.TplName = "desktop/home.html"
}

func (c *CityControler) Get() {
	cityName := models.CitiesMap[c.Ctx.Input.Param(":city")]
	if cityName == "" {
		c.Abort("404")
	}
	c.Data["CityName"] = cityName
	c.Data["Category"] = "CATEGORIES"
	c.Data["CityPath"] = c.Ctx.Input.Param(":city")
	c.Data["Categories"] = models.Categories
	c.TplName = "desktop/home.html"
}

func (c *FetchCities) Get() {
	c.Data["json"] = models.Cities
	c.ServeJSON()
	c.StopRun()
}

func (c *CategoryControler) Get() {
	cityName := models.CitiesMap[c.Ctx.Input.Param(":city")]
	categoryName := models.CategoryMap[c.Ctx.Input.Param(":category")]
	if cityName == "" || categoryName == "" {
		c.Abort("404")
	}
	c.Data["CityName"] = cityName
	c.Data["CityPath"] = c.Ctx.Input.Param(":city")
	c.Data["Category"] = categoryName
	c.Data["Categories"] = models.Categories
	c.TplName = "desktop/listing.html"
}
