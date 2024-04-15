function ControlEndStep() {
	/*with obj_button
	if mypopuplevel < g.popuplevel
		instance_destroy();
	*/

	// get rid of drop downs
	if mouse_check_button_pressed(mb_left)
	and dropdownclicked == false
	with obj_button
	{
		if type = BTN_TOPBAR active = false;
		else if type = BTN_DROPDOWN
			instance_destroy();
	}


}
