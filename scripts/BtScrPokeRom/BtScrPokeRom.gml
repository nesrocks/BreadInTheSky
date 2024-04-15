function BtScrPokeRom() {
	g.popuplevel--;
	var popup = instance_create_depth(0,0,g.popuplevel+1,obj_popuppokerom);
	popup.mypopuplevel = g.popuplevel;

	popup.text = @"
	-----------
	-ROM POKER-
	-----------

	SELECT A BYTE INTERVAL
	AND CLICK SAVE POKED ROMS.

	THEN IT WILL GENERATE A LOT OF ROMS. ONE FOR EACH
	BYTE IN THAT INTERVAL WITH POKED BYTES FOR YOU TO
	TEST ON O2EM AND FIND ADDRESSES FOR STUFF
	";

	var xx = (g.gamewidth/2)-12;
	var yy = 180;
	var gap = 16;
	CreateButton(			xx,yy,		24,"HIGHER",BtScrPokeRomUp,BTN_REGULAR);			  {yy+=gap};
	instance_create_depth(	xx,yy,		g.popuplevel-1,obj_displaypokeinterval);			  {yy+=gap};
	CreateButton(			xx,yy,		24,"LOWER",BtScrPokeRomDown,BTN_REGULAR);			  {yy+=gap};
	CreateButton(			xx,yy,		24,"SAVE POKED ROMS",BtScrPokeSave,BTN_REGULAR);


}
