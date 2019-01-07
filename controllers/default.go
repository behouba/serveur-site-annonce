package controllers

import (
	"fmt"
	"serveur/models"
)

// Get method of MainController handle request for home page
func (c *MainController) Get() {
	c.TplName = "desktop/home.html"
}

// Get method of FPathController
// handle request related to specific location or specific store
func (c *FPathController) Get() {
	cityName := models.CitiesMap[c.Ctx.Input.Param(":fPath")]
	if cityName == "" {
		store, err := models.GetStore(c.Ctx.Input.Param(":fPath"))
		if err != nil {
			fmt.Println(err)
			c.Abort("404")
		}
		c.Data["StoreName"] = store.Name
		c.TplName = "desktop/on-store.html"
	} else {
		c.Data["CityName"] = cityName
		c.Data["CityPath"] = c.Ctx.Input.Param(":fPath")
		c.TplName = "desktop/home.html"
	}
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
