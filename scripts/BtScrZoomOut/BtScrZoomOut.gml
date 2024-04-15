function BtScrZoomOut() {
	with g
	{
		if window_get_fullscreen()
		{
			window_set_fullscreen(!window_get_fullscreen());
			zoom = max(1, floor(display_get_width()/gamewidth)-1);
			ScreenConfig();
			//surface_resize(g.HDSurf,window_get_width(),window_get_height());
		}
		else if zoom > 1
		{
			zoom--;
			ScreenConfig();
			//surface_resize(g.HDSurf,window_get_width(),window_get_height());
		}
	}


}
