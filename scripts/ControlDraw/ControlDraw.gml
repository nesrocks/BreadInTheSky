function ControlDraw() {
	// draw top bar text
	draw_set_halign(fa_left);
	draw_set_color(c_gray);
	draw_set_font(g.btn_fonts[BTN_HANDLE]);
	draw_text(8,2,g.UITitle); // + " Untitled Project");

	draw_set_color(c_lightgray)
	draw_rectangle(1,coord_tabs_y+tabs_height,g.gamewidth-2,g.gameheight-topbar_height-2,false);

	ModuleDraw();

	/*
	// draw fps
	draw_set_halign(fa_right);
	draw_set_font(g.btn_fonts[BTN_STATUSBAR]);
	draw_text(g.gamewidth-2,g.gameheight-g.btn_heights[BTN_STATUSBAR]-8,fps);*/
	/*
	// draw undo history
	draw_set_font(hexfont);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_rectangle(400,50,g.gamewidth,g.gameheight,false);
	var yy = 50 + 8
	draw_set_color(c_white);
	draw_circle(400-8,yy + (historypos * 12),3,false);
	for (var i= 0; i < ds_list_size(actionhistory); i++)
	{
		draw_text(408,yy,string(actionhistory[| i]));
		yy+=12
	}




	/*
	draw_point(handleright,10);

	draw_circle(mouse_x,mouse_y,3,true);
	draw_rectangle(0,0,handleright,handle_height,true);

	draw_text(50,50,dragging);

	/*

	//Draw_palette();
	//Draw_attributes();

/* end ControlDraw */
}
