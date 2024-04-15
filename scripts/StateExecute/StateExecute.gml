function StateExecute() {
	if(script_exists(state))
	  script_execute(state);
	else
	  StateSwitch(ds_map_find_first(state_map));



}
