package controllers

import (
	"serveur/models"
)

// Get method of MainController handle request for home page
func (c *MainController) Get() {
	c.Data["CityName"] = "Choisissez votre localité"
	c.Data["CityPath"] = "civ"
	c.Data["Category"] = "CATEGORIES"
	c.TplName = "desktop/home.html"
}

// Get method of CityControler
// handle request to show ads related to
// a specific city
func (c *CityControler) Get() {
	cityName := models.CitiesMap[c.Ctx.Input.Param(":city")]
	if cityName == "" {
		c.Abort("404")
	}
	c.Data["CityName"] = cityName
	c.Data["Category"] = "CATEGORIES"
	c.Data["CityPath"] = c.Ctx.Input.Param(":city")
	c.TplName = "desktop/home.html"
}

// Get method of FetchCities serve json
// data of all cities
func (c *FetchCities) Get() {
	c.Data["json"] = models.Cities
	c.ServeJSON()
	c.StopRun()
}

// Get methods of CategoryController handle request to show
// ads related to a specific category
func (c *CategoryControler) Get() {
	cityName := models.CitiesMap[c.Ctx.Input.Param(":city")]
	categoryName := models.CategoryMap[c.Ctx.Input.Param(":category")]
	if cityName == "" || categoryName == "" {
		c.Abort("404")
	}
	c.Data["CityName"] = cityName
	c.Data["CityPath"] = c.Ctx.Input.Param(":city")
	c.Data["Category"] = categoryName
	c.TplName = "desktop/listing.html"
}
