function BtScrZoomIn() {
	with g
	{
		var zoom2 = max(1, floor(display_get_height()/gameheight));
		if zoom2 < max(1, floor(display_get_width()/gamewidth))
		{
			if zoom < max(1, floor(display_get_height()/gameheight))
			{
				zoom++;
				ScreenConfig();
				//surface_resize(g.HDSurf,window_get_width(),window_get_height());
			}
		}
		else if zoom < max(1, floor(display_get_width()/gamewidth))
		{
			zoom++;
			ScreenConfig();
			//surface_resize(g.HDSurf,window_get_width(),window_get_height());
		}
	}


}
