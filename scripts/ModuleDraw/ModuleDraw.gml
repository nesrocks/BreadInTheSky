function ModuleDraw() {
	if popup exit;

	if loadedrom == -1
	{
		draw_sprite_ext(spr_loadarom,0,1,26,2,2,0,c_white,1);
		exit;
	}
	else draw_sprite_ext(spr_pickaxebg,0,1,26,2,2,0,c_white,1);
	draw_set_font(o2font);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	var centerhoriz = gamewidth/2;
	draw_text_ext_transformed(centerhoriz,33,"ROM: " + loadedROM,0,9999,2,2,0)


	for (var i = 0; i < array_length_1d(assets_level); i++)
	{
		draw_set_color(make_color_rgb(198,0,8));
		if assets_level[i] == 1
		{
			var currx = i div 8;
			var curry = i mod 8;
			draw_line_width(
			gridinitx+(currx*gridwid),			//x1
			gridinity+(curry*gridhei),			//y1
			gridinitx+gridwid+(currx*gridwid),  //x2
			gridinity+(curry*gridhei),			//y2
			gridthick);
		}
	}


	draw_set_font(o2font);
	draw_set_color(c_red);
	draw_text_ext_transformed(centerhoriz,250,"STAGE " + string(currentlevel),0,222,2,2,0)

	// draw mouse "cursor"
	if gridmouse == -1 exit;

	draw_set_color(c_teal);
	/*
	draw_text(10,29,mxx);
	draw_text(10,37,myy);
	draw_text(60,29,gridmouse);
	*/
	var currx = gridmouse div 8;
	var curry = gridmouse mod 8;

	var margin = 3;
	draw_rectangle(
	gridinitx+(currx*gridwid)-margin,			//x1
	gridinity+(curry*gridhei)-margin,			//y1
	gridinitx+gridwid+(currx*gridwid)+margin,  //x2
	gridinity+(curry*gridhei)+gridhei+margin,	//y2
	true);

	/*
	draw_line_width(
	gridinitx+(currx*gridwid),			//x1
	gridinity+(curry*gridhei),			//y1
	gridinitx+gridwid+(currx*gridwid),  //x2
	gridinity+(curry*gridhei),			//y2
	gridthick);

	/*
	if currentmodule == MODULE_NAM
		ModuleNamDraw();	
	else if currentmodule == MODULE_SCREEN {}
	else if currentmodule == MODULE_CHR
		ModuleChrDraw();
	else if currentmodule == MODULE_PALETTE {}
	else if currentmodule == MODULE_METATILES
		ModuleMttDraw();
	else if currentmodule == MODULE_MAP {}
	else if currentmodule == MODULE_METASPRITES {}
	else if currentmodule == MODULE_PREVIEW {}

/* end ModuleDraw */
}
