function UIDestroy() {
	with obj_button
	if type == BTN_CHECKBOX
	or type == BTN_DROPDOWN 
	or type == BTN_PALETTE 
	or type == BTN_POPUP 
	or type == BTN_REGULAR
	or type == BTN_TABS
	//or type == BTN_TOPBAR
	instance_destroy();


}
