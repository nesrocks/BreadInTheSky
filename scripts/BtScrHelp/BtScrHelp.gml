function BtScrHelp() {
	g.popuplevel--;
	var popup = instance_create_depth(0,0,g.popuplevel,obj_popup);
	popup.mypopuplevel = g.popuplevel;
	popup.text = @"
	--------------------
	- BREAD IN THE SKY -
	-    HOW TO USE    -
	--------------------

	SIMPLY LOAD A ROM
	AND USE THE LEFT MOUSE BUTTON
	TO SET / REMOVE LINES

	EMPTY LINES ON THE MIDDLE COLUMN
	MAY RESULT IN AN UNBEATABLE LEVEL

	THE EDITOR FORCES A CRC32 HASH
	WHEN SAVING THE ROM SO O2EM
	PLAYS IT AT THE CORRECT SPEED

	SORRY NO UNDO YET SO PLEASE
	KEEP BACKUPS OF YOUR ROMS


	COMPATIBLE WITH:
	PICK AXE PETE~ 4K     PAL 
	PICK AXE PETE~ 8K VP+ PAL 
	PICK AXE PETE~ 8K VP+ NTSC
	ROMS EDITED USING BITS   
	";
	//CreateButton( (g.gamewidth/2)-12,200,24,g.btn_confirm_text[0],BtScrConfirm,BTN_POPUP);


}
