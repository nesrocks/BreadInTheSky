function BtScrCreateDropDown() {
	/*if active
	{
		active = false;
		exit;
	}
	*/
	g.popuplevel--;
	g.dropdownclicked = true;
	var currx = x;
	var curry = y + sprite_height;

	draw_set_font(g.btn_fonts[BTN_DROPDOWN]);

	// get the width of the widest text
	var maxwid = 0;
	for (var i=0; i < array_length_1d(dropdowntexts); i++)
	{
		var thiswid = string_width(ArrayGetPos(dropdowntexts,i));
		if thiswid > maxwid maxwid = thiswid;
	}

	// predict the dropdown bleeding to the right of the screen,
	// in which case move it to the left simulating a right alignment,
	// but in reality it is still left aligned
	if currx + maxwid + (g.btn_border*2) > g.gamewidth
	{
		// get the dropdown real width
		var truewidth = maxwid + (g.btn_border*2);
		if truewidth mod 2 != 0 truewidth++;
	
		// move left
		currx -= truewidth - sprite_width;
	}

	// create the buttons
	for (var i=0; i < array_length_1d(dropdowntexts); i++)
	{
		if dropdowntexts[i] == "SAVE ROM AS..." and g.loadedrom == -1 {}
		else
		{
		CreateButton(currx,curry,maxwid,ArrayGetPos(dropdowntexts,i), ArrayGetPos(dropdownscripts,i),BTN_DROPDOWN);
		curry+=g.topbar_height;
		}
	}


}
