function StateEditor() 
{
	if state_new
	{
		state_new = false;
		framecount = 0;
	
		ModuleInit();
	}
	else
	{
		IDEStep();
		ModuleStep();
	}


}
