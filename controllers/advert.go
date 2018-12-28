package controllers

func (c *AdvertControler) Get() {
	c.TplName = "desktop/advert.html"
}

func (c *CreateAdvertControler) Get() {
	c.TplName = "desktop/create.html"
}
