function ButtonDraw() {
	draw_self();

	if type == BTN_SWITCH image_index = (counter*2)-1;
	else image_index = 0;

	if !clickable exit;

	if type == BTN_SWITCH
	{
		if point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width-1,y+sprite_height-1)	
			image_index = (counter*2);
	}
	else if active or (type == BTN_TABS and g.currentmodule-1 == tabindex) image_index = 2;
	else if point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width-1,y+sprite_height-1)
	//or active
	{
		image_index = 1;
		//draw_set_color(c_white);
		//if highlightstyle == 0 draw_line(x-1,y+sprite_height-1,x+sprite_width-1,y+sprite_height-1);
		//else if highlightstyle == 1 draw_line(x-1,y,x+sprite_width-1,y);
		//else if highlightstyle == 2 draw_line(x+sprite_width-1,y,x+sprite_width-1,y+sprite_height-1);
	}

	/*
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_rectangle(x,y,x+sprite_width-1,y+sprite_height-1,false);

/* end ButtonDraw */
}
