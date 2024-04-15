function ArrayGetPos(argument0, argument1) {
	var array = argument0;
	var pos = argument1;
	/*
	if !is_array(array)
	{
		var typeoff = typeof(array);
		show_debug_message("it is not even an array");
		show_debug_message("array: " + string(array));
		show_debug_message("position: " + string(pos));	
		return 0;
	}
	else
	{*/
		var len = array_length_1d(array);
		if pos > len
		{
			show_debug_message("trying to get a value out of range on the array.");
			show_debug_message("array: " + string(array));
			show_debug_message("array size: " + string(len));
			show_debug_message("position: " + string(pos));	
			return array[len];
		}
		else return array[pos]
	//}


}
