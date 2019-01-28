package controllers

import (
	"encoding/json"
	"log"
	"net/http"
	"serveur/models"
)

func (c *AdvertControler) Get() {
	c.TplName = "desktop/advert.html"
}

func (c *CreateAdvertControler) Get() {
	c.TplName = "desktop/create.html"
}

func (c *CreateAdvertControler) Post() {
	var advert models.Advert

	err := json.Unmarshal(c.Ctx.Input.RequestBody, &advert)
	if err != nil {
		log.Println(err)
		return
	}

	// Get user's id and add it into userID field of
	// advert
	user := c.Ctx.Input.GetData("User").(models.User)
	advert.UserID = user.ID

	if errResp := advert.Validate(); errResp.Code != http.StatusOK {
		c.Ctx.Output.SetStatus(http.StatusBadRequest)
		c.Data["json"] = errResp
		c.ServeJSON()
	}

	if err := advert.Save(); err != nil {
		log.Println(err)
		c.Ctx.Output.SetStatus(http.StatusInternalServerError)
		return
	}
	c.Data["json"] = advert
	c.ServeJSON()
}
