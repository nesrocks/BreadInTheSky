function UIDataInit() {
#macro BTN_TOPBAR 0		// topbar
#macro BTN_TABS 1		// tabs
#macro BTN_HANDLE 2		// zoom/close/nsf
#macro BTN_DROPDOWN 3	// dropdown options
#macro BTN_POPUP 4		// popup buttons
#macro BTN_CHECKBOX 5	// checkbox
#macro BTN_PALETTE 6	// palette
#macro BTN_STATUSBAR 7	// status
#macro BTN_REGULAR 8	// common buttons
#macro BTN_SWITCH 9		// button that can have different states
#macro BTN_SCROLL 10	// scroll for lists

	// organize by 5 on tabs for readability
	buttontypes = [	BTN_TOPBAR,		BTN_TABS,		BTN_HANDLE,		BTN_DROPDOWN,	BTN_POPUP,
					BTN_CHECKBOX,	BTN_PALETTE,	BTN_STATUSBAR,	BTN_REGULAR,	BTN_SWITCH];
	btn_heights = [	topbar_height,	tabs_height,	handle_height,	topbar_height,	topbar_height+3,
					10,				topbar_height,	topbar_height,	topbar_height,	topbar_height];
	btn_styles  = [	0,				0,				0,				2,				3,
					3,				3,				0,				0,				0];
	btn_bgcols  = [	c_darkgray,		c_gray,			c_lightgray,	c_darkgray,		c_darkgray,
					c_yellow,		c_yellow,		c_black,		c_darkgray,		c_darkgray];
	btn_textcols= [	c_lightgray,	c_black,		c_black,		c_lightgray,	c_lightgray,
					c_purple,		c_purple,		c_lightgray,	c_lightgray,	c_lightgray];
	btn_roundeds= [	0,				1,				0,				0,				0,
					0,				0,				0,				0,				0];
	btn_r_aligns= [	0,				0,				1,				0,				0,
					1,				1,				1,				0,				0];
	btn_canactive=[	1,				1,				0,				0,				0,				
					0,				0,				0,				0,				0];
	btn_textalign=[	fa_center,		fa_center,		fa_center,		fa_left,		fa_center,
					fa_left,		fa_center,		fa_center,		fa_left,		fa_left];
	btn_fonts=	  [	segafont,		retrofont,		retrofont,		retrofont,		segafont,		
					segafont,		segafont,		segafont,		segafont,		segafont];

	// define handle btns here
	handle_texts =	["X"];
	handle_scripts= [BtScrFileExit];

	// define drop downs here
	if public dropd_texts = ["FILE","VIEW","INFO"];
	else dropd_texts = ["FILE","VIEW","POKE","INFO"];

	// define dd contents
	var ddFiletxt = ["OPEN ROM", "SAVE ROM AS...", "EXIT"];
	var ddFilescr = [BtScrImportRom, BtScrExportNrom, BtScrFileExit];
	var ddViewtxt = ["ZOOM IN (I)","ZOOM OUT (O)"];
	var ddViewscr = [BtScrZoomIn,BtScrZoomOut];
	var ddPoketxt = ["POKE A ROM"];
	var ddPokescr = [BtScrPokeRom];
	var ddAbouttxt= ["HELP", "ABOUT"];
	var ddAboutscr= [BtScrHelp, BtScrAbout];

	//dropd_content_texts =	[ddFiletxt,ddEdittxt,ddViewtxt,ddNamtxt,ddScrtxt,ddChrtxt,ddPaltxt,ddMtttxt,ddMaptxt,ddMtstxt,ddAbouttxt];
	//dropd_content_scripts = [ddFilescr,ddEditscr,ddViewscr,ddNamscr,ddScrscr,ddChrscr,ddPalscr,ddMttscr,ddMapscr,ddMtsscr,ddAboutscr];
	if public dropd_content_texts =	[ddFiletxt,ddViewtxt,ddAbouttxt];
	else dropd_content_texts =	[ddFiletxt,ddViewtxt,ddPoketxt,ddAbouttxt];
	if public dropd_content_scripts = [ddFilescr,ddViewscr,ddAboutscr];
	else dropd_content_scripts = [ddFilescr,ddViewscr,ddPokescr,ddAboutscr];

	btn_confirm_text = ["OK"];
	btn_cancel_text = ["CANCEL"];

	UITitle = "Bread In The Sky (BITS) ver " + string(version);



}
