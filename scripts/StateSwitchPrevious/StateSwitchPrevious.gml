function StateSwitchPrevious() {
	ds_stack_pop(state_stack);
	state = ds_stack_top(state_stack);
	StateSwitch(state);


}
