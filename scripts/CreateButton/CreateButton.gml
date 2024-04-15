/// @function CreateButton(xx,yy,width,text,script_name,btn_type)
/// @description Create a button dynamically
/// @param {integer} x
/// @param {integer} y
/// @param {integer} width_zero_if_auto
/// @param {string} text
/// @param {real} script_name
/// @param {integer} button_type
function CreateButton(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xx = argument0;
	var yy = argument1;
	var btnwid = argument2;
	var text = argument3;
	var myscriptname = argument4;
	var type = argument5;

	var btnhei =		g.btn_heights	[type];
	var style =			g.btn_styles	[type];
	var bgcol =			g.btn_bgcols	[type];
	var textcol =		g.btn_textcols	[type];
	var rounded =		g.btn_roundeds	[type];
	var canbeactive =	g.btn_canactive	[type];
	var rightaligned =	g.btn_r_aligns	[type];
	draw_set_halign(	g.btn_textalign	[type]);
	draw_set_font(		g.btn_fonts		[type]);

	g.framecount = 0;

	// is the width fixed or auto
	if btnwid == 0 btnwid += string_width(text);
	// fix odd widths
	btnwid += (g.btn_border*2);

	if btnwid mod 2 != 0 btnwid++;

	if rightaligned xx -= btnwid;

	var extray = 0;
	if type == BTN_POPUP
	{
		xx = (g.gamewidth/2) - btnwid/2;
		extray = 2;
	}
 
	draw_set_valign(fa_top);
	var btn = instance_create_depth(xx,yy,g.popuplevel,obj_button);
	var btnsurf = surface_create(btnwid,btnhei);
	surface_set_target(btnsurf);
	draw_clear_alpha(c_black, 0.0);

	// draw elements to the surface (frame 0 : idle)
	draw_set_color(bgcol);
	if !rounded draw_rectangle(0,0,btnwid,btnhei,false);
	else
	{
		draw_rectangle(1,0,btnwid-2,btnhei,false);
		draw_rectangle(0,1,0,btnhei,false);
		draw_rectangle(btnwid-1,1,btnwid-1,btnhei,false);
	}
	if typeof(text) != "string"
	{
		draw_sprite(text,0,btnwid/2,3);
	}
	else
	{
		draw_set_color(textcol);
		if g.btn_textalign[type] == fa_center draw_text(btnwid/2,3+extray,text);
		else draw_text(g.btn_border,3+extray,text);
	}
	// done drawing, turn the surface into a sprite and free it
	var btnspr0 = sprite_create_from_surface(btnsurf,0,0,btnwid,btnhei,false,false,0,0);



	// draw elements to the surface (frame 1: mouse over)
	draw_set_color(bgcol);
	if !rounded  draw_rectangle(0,0,btnwid,btnhei,false);
	else
	{
		draw_rectangle(1,0,btnwid-2,btnhei,false);
		draw_rectangle(0,1,0,btnhei,false);
		draw_rectangle(btnwid-1,1,btnwid-1,btnhei,false);
	}
	if typeof(text) != "string"
	{
		draw_sprite(text,1,btnwid/2,3);
	}
	else
	{
		draw_set_color(g.c_mouseovertxt);
		if g.btn_textalign[type] == fa_center draw_text(btnwid/2,3+extray,text);
		else draw_text(g.btn_border,3+extray,text);
	}
	// done drawing, turn the surface into a sprite and free it
	var btnspr1 = sprite_create_from_surface(btnsurf,0,0,btnwid,btnhei,false,false,0,0);


	// draw elements to the surface (frame 2: active)
	draw_set_color(g.c_lightgray);
	if !rounded  draw_rectangle(0,0,btnwid,btnhei,false);
	else
	{
		draw_rectangle(1,0,btnwid-2,btnhei,false);
		draw_rectangle(0,1,0,btnhei,false);
		draw_rectangle(btnwid-1,1,btnwid-1,btnhei,false);
	}
	if typeof(text) != "string"
	{
		draw_sprite(text,2,btnwid/2,3);
	}
	else
	{
		draw_set_color(c_black);
		if g.btn_textalign[type] == fa_center draw_text(btnwid/2,3+extray,text);
		else draw_text(g.btn_border,3+extray,text);
	}
	// done drawing, turn the surface into a sprite and free it
	var btnspr2 = sprite_create_from_surface(btnsurf,0,0,btnwid,btnhei,false,false,0,0);


	surface_reset_target();
	surface_free(btnsurf);
	sprite_merge(btnspr0, btnspr1);
	sprite_merge(btnspr0, btnspr2);
	sprite_delete(btnspr1);
	sprite_delete(btnspr2);


	// assign some stuff to the button instance
	btn.sprite_index = btnspr0; // assign the sprite
	btn.image_speed = 0;
	btn.image_index = 0;
	btn.highlightstyle = style;
	btn.myscript = myscriptname;
	btn.text = text;
	btn.canbeactive = canbeactive;
	btn.type = type;
	if type == BTN_TOPBAR 
	{
		btn.dropdowntexts = g.dropd_content_texts[g.btncounter];
		btn.dropdownscripts = g.dropd_content_scripts[g.btncounter];
		g.btncounter++;
	}
	else if type == BTN_TABS
	{
		btn.tabindex = g.btncounter;
		g.btncounter++;
	}
	else if type == BTN_POPUP
	{
		btn.depth -=1;
	}

	return btnwid;


}
