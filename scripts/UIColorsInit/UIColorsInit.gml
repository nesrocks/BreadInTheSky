function UIColorsInit() {
	var val;

	// set bg color
	val = 30;
	var lay_id = layer_get_id("UIbgcolor");
	var back_id = layer_background_get_id(lay_id);
	layer_background_blend(back_id, make_color_rgb(val,val,val));

	val = 60;
	c_darkgray = make_color_rgb(val+90,val,val);
	val = 90;
	c_meddarkgray = make_color_rgb(val+40,val,val);
	val = 180;
	c_lightgray = make_color_rgb(val+30,val,val);
	val = 255;
	c_mouseovertxt = make_color_rgb(val,val,val);



}
