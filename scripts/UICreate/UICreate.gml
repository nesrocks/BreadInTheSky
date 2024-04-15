function UICreate() {
	// create tool bar buttons
	var currx = 1;
	btncounter = 0;
	for (var i = 0; i < array_length_1d(dropd_texts); i++)
	{
		var textstemp = dropd_content_texts[i];
		var tempscript = dropd_content_scripts[i];
		if array_length_1d(textstemp) == 1
		// button has only 1 list, create button with no drop down
		currx+=CreateButton(currx,handle_height,0,textstemp[0],tempscript[0],BTN_TOPBAR);
		else // create button with drop down
		currx+=CreateButton(currx,handle_height,0,dropd_texts[i],BtScrCreateDropDown,BTN_TOPBAR);
	}

	/*
	// create tabs buttons
	var currx = 1;
	btncounter = 0;
	for (var i = 0; i < array_length_1d(tabs_texts); i++)
	currx+=CreateButton(currx,coord_tabs_y,0,tabs_texts[i],tabs_scripts[i],BTN_TABS)+1;
	*/

	// create handle buttons (recreate regular windows buttons minimize, maximize, close)
	var currx = gamewidth;
	for (var i = 0; i < array_length_1d(handle_texts); i++)
	currx-=CreateButton(currx,0,0,handle_texts[i],handle_scripts[i],BTN_HANDLE);

	handleright = currx; // this is used to know the dragable area on the handle bar

	// create status bar buttons (ui zoom and nsf control)
	/*
	var currx = gamewidth-1;
	for (var i = 0; i < array_length_1d(statusbtn_texts); i++)
	currx-=CreateButton(currx,g.gameheight-g.topbar_height-1,0,statusbtn_texts[i],statusbtn_scripts[i],BTN_STATUSBAR);



/* end UICreate */
}
