//////////////
function IDEStep() {
	// MINIMIZE //
	//////////////

	//////////////
	// DRAGGING //
	//////////////

	// is mouse over the handle bar?
	if point_in_rectangle(mouse_x,mouse_y,0,0,handleright,g.handle_height)
	{
		// did the user just started dragging?
		if mouse_check_button_pressed(mb_left)
		{
			dragging = true;
			offsetx = window_get_x() - display_mouse_get_x();
			offsety = window_get_y() - display_mouse_get_y();
		}
	}

	// is the user dragging?
	if !mouse_check_button(mb_left) dragging = false;

	// do drag
	else if dragging window_set_position(display_mouse_get_x()+offsetx,display_mouse_get_y()+offsety);


	/////////////
	// HOTKEYS //
	/////////////
	if keyboard_check_pressed(ord("O"))
	{
		if zoom > 1
		{
			zoom--;
			ScreenConfig();
		}
	}
	else if keyboard_check_pressed(ord("I"))
	{
		with g
		{
			var zoom2 = max(1, floor(display_get_height()/gameheight));
			if zoom2 < max(1, floor(display_get_width()/gamewidth))
			{
				if zoom < max(1, floor(display_get_height()/gameheight))
				{
					zoom++;
					ScreenConfig();
				}
			}
			else if zoom < max(1, floor(display_get_width()/gamewidth))
			{
				zoom++;
				ScreenConfig();
			}
		}
	}
	else if keyboard_check_pressed(vk_f12)
	{
		BtScrSaveScreenshot();
	}
}
