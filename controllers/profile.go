package controllers

func (c *ProfileControler) Get() {
	c.TplName = "desktop/profile-ads.html"
}

func (c *ProfileFavoritesControler) Get() {
	c.TplName = "desktop/profile-favorites.html"
}

func (c *ProfileMessengerControler) Get() {
	c.TplName = "desktop/profile-msg.html"
}

func (c *ProfileSettingsControler) Get() {
	c.TplName = "desktop/profile-settings.html"
}
