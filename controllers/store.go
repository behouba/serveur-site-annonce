package controllers

func (c *StoresListController) Get() {
	c.TplName = "desktop/stores-listing.html"
}

func (c *StoreOnControler) Get() {
	c.TplName = "desktop/my-store-on-ads.html"
}

func (c *StoreOffControler) Get() {
	c.TplName = "desktop/my-store-off-ads.html"
}

func (c *StoreFavoritesControler) Get() {
	c.TplName = "desktop/my-store-fav.html"
}

func (c *StoreMessengerControler) Get() {
	c.TplName = "desktop/my-store-msg.html"
}

func (c *StoreSettingsControler) Get() {
	c.TplName = "desktop/my-store-setting.html"
}

func (c *StoreStatsControler) Get() {
	c.TplName = "desktop/my-store-stats.html"
}
