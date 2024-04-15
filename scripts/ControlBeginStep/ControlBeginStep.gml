function ControlBeginStep()
{
	btnclicked = false;
	dropdownclicked = false; // check this at the end step event to destroy all dropdowns

	// define which button is clickable based on which one is on top.
	// also used to mouse over/highlight only the top button.
	var btns = ds_list_create();
	var _num = instance_position_list(mouse_x, mouse_y, obj_button, btns, false);

	// find which is the top button at the mouse position
	var topbtnlevel = 0;
	var topbutton = -1; // the instance id of the top most button
	for (var i = 0; i < _num; ++i;)
	{
		var instance = btns[| i];
	
		instance.clickable = false;
	
		if instance.mypopuplevel <= topbtnlevel	
		{
			topbutton = instance;
			topbtnlevel = instance.mypopuplevel;
		}	
	}

	if topbutton topbutton.clickable = true;

	ds_list_destroy(btns);



}
