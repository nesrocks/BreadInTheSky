function BtScrFullScreenToggle() {
	with g
	{
		window_set_fullscreen(!window_get_fullscreen());
		zoom = max(1, floor(display_get_width()/gamewidth));
		ScreenConfig();
		//surface_resize(g.HDSurf,window_get_width(),window_get_height());
	}


}
