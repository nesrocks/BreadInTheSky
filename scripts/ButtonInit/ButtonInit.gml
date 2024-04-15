function ButtonInit() {
	myscript = BtScrDefault;

	highlightstyle = 0;

	active = false;
	canbeactive = false; //sometimes a button can't stay active, it simply does an action when it's clicked and that's it

	mypopuplevel = g.popuplevel;


	text = "empty btn";

	clickable = true; // used so only one button is clickable

	tabindex = -1; // used only on tab buttons

	// used only by switch types
	counter = 0;
	maxcount = 1;

	/*
	0 = underline
	1 = topline


/* end ButtonInit */
}
