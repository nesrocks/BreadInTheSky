function ModuleStep() {
	repeatcounter++;

	if popup exit;
	if g.framecount < g.clickdelay exit;

	// don't allow editing if there's a drop down visible or a popup button visible
	var editing = true;
	with obj_button
	{
		if type == BTN_POPUP
		or type == BTN_DROPDOWN
		editing = false;
	}

	gridmouse = MousetoGrid(); // i is current grid spot

	if mouse_check_button_pressed(mb_left) and gridmouse != -1 and !g.btnclicked and editing
	{
		//var boole = assets_level[gridmouse]
		if assets_level[gridmouse] == 1 adding = false;
		else adding = true;	
	}

	if mouse_check_button(mb_left) and gridmouse != -1 and !g.btnclicked and editing
	{
		assets_level[gridmouse] = adding;
	}

	if keyboard_check_pressed(ord("1"))
	{
		SaveLevel();
		currentlevel = 1;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("2"))
	{
		SaveLevel();
		currentlevel = 2;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("3"))
	{
		SaveLevel();
		currentlevel = 3;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("4"))
	{
		SaveLevel();
		currentlevel = 4;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("5"))
	{
		SaveLevel();
		currentlevel = 5;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("6"))
	{
		SaveLevel();
		currentlevel = 6;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("7"))
	{
		SaveLevel();
		currentlevel = 7;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("8"))
	{
		SaveLevel();
		currentlevel = 8;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("9"))
	{
		SaveLevel();
		currentlevel = 9;
		LoadLevel();
	}
	else if keyboard_check_pressed(ord("0"))
	{
		SaveLevel();
		currentlevel = 0;
		LoadLevel();
	}



	/*
	if currentmodule == MODULE_NAM
		ModuleNamStep();
	else if currentmodule == MODULE_CHR
		ModuleChrStep();
	else if currentmodule == MODULE_METATILES
		ModuleMttStep();

/* end ModuleStep */
}
