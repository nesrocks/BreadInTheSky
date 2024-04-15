function ButtonStep() {
	if g.btnclicked exit; // only click one button per frame
	if !clickable exit; // not the top most button at the mouse position
	if g.framecount < g.clickdelay exit;
	if type = BTN_TABS and g.popup exit;

	// did the user click on my area?
	if point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height)
	and mouse_check_button_pressed(mb_left)
	{
		// set global
		g.btnclicked = true;
	
		// am I the top button? (this considers the UI never creates two buttons at the same level at the same place
		/*if mypopuplevel >= g.popuplevel
		{
		
			// delete the buttons that are on top
			var clickedlevel = mypopuplevel		
			with obj_button
			if mypopuplevel < clickedlevel
			and type == BTN_DROPDOWN
			{
				show_debug_message("deleting dropdown button on top: " + string(text))
				instance_destroy();
			}*/
		if type != BTN_HANDLE
		{
			// sets the new top level (the level can go down)		
			g.popuplevel = mypopuplevel;
		
			// sets the button to active if it can be active
			if canbeactive and type != BTN_TABS
			{
				// deactivate all other buttons
				with obj_button active = false;
				active = true;
			}
				
			//if type == BTN_DROPDOWN
	
			with obj_button if type == BTN_DROPDOWN or type = BTN_POPUP
			{
				instance_destroy();
			}
	
			if type != BTN_SCROLL and type != BTN_REGULAR
			{
				instance_destroy(obj_popup);
				instance_destroy(obj_popuppokerom);
				instance_destroy(obj_displaypokeinterval);
			}
	
			if type == BTN_SWITCH
			{
				counter++;
				if counter > maxcount counter = 1;		
			}
		}
		script_execute(myscript)
		//}
	}


}
