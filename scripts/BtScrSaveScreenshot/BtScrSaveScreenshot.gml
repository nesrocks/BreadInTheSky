function BtScrSaveScreenshot() {
	var file;
	file = get_save_filename("screenshot|*.png", "test.png");
	if file != ""
	{
	   screen_save(file);
	}


}
