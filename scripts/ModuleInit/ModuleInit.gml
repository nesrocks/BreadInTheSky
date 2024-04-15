function ModuleInit() {
	with obj_button if type == BTN_REGULAR or type == BTN_SWITCH
	{
		instance_destroy();
	}

	gridinitx = 14;
	gridinity = 48;
	gridwid = 32;
	gridhei = 24;
	gridthick = 2;
	gridmouse = -1; // current grid spot the mouse is on
	mxx = 0;

	adding = false; // adding or deleting lines (used for mouse drag draw)


}
