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
	id, err := strconv.Atoi(c.Ctx.Input.Query("formId"))
	if err != nil {
		log.Println(err)
		return
	}
	rawJSON, err := models.GetFormState(id)
	c.Data["json"] = rawJSON
	c.ServeJSON()
}
