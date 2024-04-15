/// @function CreateSwitch(xx,yy,width,texts,script_name,btn_type)
/// @description Create a switch button dynamically
/// @param {integer} x
/// @param {integer} y
/// @param {integer} width_zero_if_auto
/// @param {string} texts
/// @param {real} script_name
/// @param {integer} button_type
function CreateCheckbox(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xx = argument0;
	var yy = argument1;
	var btnwid = argument2;
	var textarg = argument3;
	var texts = [];
	for (var i=2; i < array_length_1d(textarg);i++)
		texts[i-2] = textarg[i];

	var myscriptname = argument4;
	var type = argument5;

	var btnhei =		g.btn_heights	[type];
	var style =			g.btn_styles	[type];
	var bgcol =			g.btn_bgcols	[type];
	var textcol =		g.btn_textcols	[type];
	var rounded =		g.btn_roundeds	[type];
	var canbeactive =	g.btn_canactive	[type];
	//var rightaligned =	g.btn_r_aligns	[type];
	draw_set_halign(	g.btn_textalign	[type]);
	draw_set_font(		g.btn_fonts		[type]);

	var btn = instance_create_depth(xx,yy,g.popuplevel,obj_button);
	btn.x = xx;

	btnwid += (g.btn_border*2);
	if btnwid mod 2 != 0 btnwid++;
	var btnsurf = surface_create(btnwid,btnhei);
	surface_set_target(btnsurf);
	draw_clear_alpha(c_black, 0.0);
	var btnspr0 = sprite_create_from_surface(btnsurf,0,0,btnwid,btnhei,false,false,0,0);
	surface_reset_target();
	surface_free(btnsurf);

	// draw the different texts states (idle, over, idle, over, etc)
	for (var j = 0; j < array_length_1d(texts); j++)
	{
		draw_set_valign(fa_top);
		var btnsurf = surface_create(btnwid,btnhei);
		surface_set_target(btnsurf);

		// draw elements to the surface (frame 0 : idle)
		draw_set_color(bgcol);
		if !rounded draw_rectangle(0,0,btnwid,btnhei,false);
		else
		{
			draw_rectangle(1,0,btnwid-2,btnhei,false);
			draw_rectangle(0,1,0,btnhei,false);
			draw_rectangle(btnwid-1,1,btnwid-1,btnhei,false);
		}
		if typeof(texts[j]) != "string"
		{
			draw_sprite(texts[j],0,btnwid/2,3);
		}
		else
		{
			draw_set_color(textcol);
			if g.btn_textalign[type] == fa_center draw_text(btnwid/2,3,texts[j]);
			else draw_text(g.btn_border,3,texts[j]);
		}
		// done drawing, turn the surface into a sprite
		var btnspr1 = sprite_create_from_surface(btnsurf,0,0,btnwid,btnhei,false,false,0,0);

		// draw elements to the surface (frame 1: mouse over)
		draw_set_color(bgcol);
		if !rounded  draw_rectangle(0,0,btnwid,btnhei,false);
		else
		{
			draw_rectangle(1,0,btnwid-2,btnhei,false);
			draw_rectangle(0,1,0,btnhei,false);
			draw_rectangle(btnwid-1,1,btnwid-1,btnhei,false);
		}
		if typeof(texts[j]) != "string"
		{
			draw_sprite(texts[j],1,btnwid/2,3);
		}
		else
		{
			draw_set_color(g.c_mouseovertxt);
			if g.btn_textalign[type] == fa_center draw_text(btnwid/2,3,texts[j]);
			else draw_text(g.btn_border,3,texts[j]);
		}
		// done drawing, turn the surface into a sprite
		var btnspr2 = sprite_create_from_surface(btnsurf,0,0,btnwid,btnhei,false,false,0,0);

		surface_reset_target();
		surface_free(btnsurf);
		sprite_merge(btnspr0, btnspr1);
		sprite_delete(btnspr1);
		sprite_merge(btnspr0, btnspr2);
		sprite_delete(btnspr2);
	}

	// assign some stuff to the button instance
	btn.sprite_index = btnspr0; // assign the sprite
	btn.image_speed = 0;
	btn.image_index = 1; // 0 is nothing
	btn.highlightstyle = style;
	btn.myscript = myscriptname;
	btn.text = texts[0];
	btn.canbeactive = canbeactive;
	btn.type = type;
	btn.counter = 1; // used only by switch types. increase this on the step event as you click it if it's a switch type
	btn.maxcount = array_length_1d(texts); // check against this on the step event to loop if it's a switch type

	if type = BTN_TOPBAR 
	{
		btn.dropdowntexts = g.dropd_content_texts[g.btncounter];
		btn.dropdownscripts = g.dropd_content_scripts[g.btncounter];
		g.btncounter++;
	}
	else if type = BTN_TABS
	{
		btn.tabindex = g.btncounter;
		g.btncounter++;
	}

	return btnwid;


}
