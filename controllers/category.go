package controllers

import (
	"log"
	"serveur/models"
	"strconv"
)

func (c *FetchCategoryController) Get() {
	id, err := strconv.Atoi(c.Ctx.Input.Param(":id"))
	if err != nil {
		c.Data["json"] = models.Categories
	} else {
		c.Data["json"], _ = models.GetCategories(id)
	}
	c.ServeJSON()
}

func (c *CategoryFormController) Get() {
	rawJSON, err := models.GetFormContent()
	if err != nil {
		log.Println(err)
	}
	c.Data["json"] = rawJSON
	c.ServeJSON()
}
