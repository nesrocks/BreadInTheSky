///state_switch(state <script or name>,<push to stack?>)
function StateSwitch() {
	var _push = true;
	if(argument_count>1)
	  _push=argument[1];


	if(is_real(argument[0]))
	{ //you passed a specific script, set it as our next state.
	  state_next=argument[0];
	  state_name="Unknown (Use the name to switch next time)";
	}
	else
	{   //you passed the name of a state, let's try and find it.
	  if(ds_map_exists(state_map,argument[0]))
	  {
	    state_next=ds_map_find_value(state_map,argument[0]);
	    state_name=argument[0];
	  }
	  else
	  {
	    state_next=ds_map_find_first(state_map);
	    show_debug_message("Tried to switch to a non-existent state: " + string(argument0) + ". Moving to first state: " + string(state_next))
	    state_name="Unknown (Tried to switch to a non-existant state)";
	  }
	}
	if(_push) 
	  ds_stack_push(state_stack,state_next);




}
