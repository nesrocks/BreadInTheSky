function BtScrAbout() {
	g.popuplevel--;
	var popup = instance_create_depth(0,0,g.popuplevel,obj_popup);
	popup.mypopuplevel = g.popuplevel;

	popup.text = @"

	--------------------
	- BREAD IN THE SKY -
	-       BITS       -
	--------------------


	A PICK AXE PETE~ LEVEL EDITOR
	FOR THE MAGNAVOX~ ODYSSEY 2~
	AND VIDEOPAC G7000~ / VP PLUS


	CREATED BY NESROCKS 2019
	- VISIT NESROCKS.COM -


	VERSION " + string(g.version) + @"

	-----------------------------
	MAGNAVOX~, PICK AXE PETE~
	ODYSSEY 2~ VIDEOPAC~ AND 
	VIDEOPAC G7000~ ARE
	THIRD PARTY TRADEMARKS OF
	PHILIPS~ ALL RIGHTS RESERVED
	-----------------------------

	";

	popup.text2 = @"
	b     I   }  

	VERSION 0.11

	  a   I   x  ";

	popup.text3 = @"
	x     s   f  

	VERSION 0.11

	  {   s   b  ";



	//CreateButton( (g.gamewidth/2)-12,210,24,g.btn_confirm_text[0],BtScrConfirm,BTN_POPUP);


}
