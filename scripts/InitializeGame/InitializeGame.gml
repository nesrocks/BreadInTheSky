////////////////////////////////////////////////////////////
function InitializeGame() {
	// Bread In The Sky BITS by Mário Azevedo aka Nesrocks 2019 
	////////////////////////////////////////////////////////////

	// public or test version
	public = 1; //this sets if I want to develop or show the game to other people
	version = 0.12;

	Crc32();
	// PICK AXE PETE
	petecrcPLUSNTSC			= $81C20196; // 8k this is the videopac PLUS 8k ntsc mod rom
	petecrcPLUSPAL			= $B2FFB353; // 8k this is the videopac PLUS 8k pal rom
	petecrcPAL				= $D62814A3; // 4k
	pete_hlines_start		= [ $2a3,$12a3];
	pete_newcrcarea			= [ $1c,$9c];

	// K.C. MUNCHKIN
	kccrcNTSC				= $7108E058; // 4k (o2_35)
	kccrcPAL				= $4A3E2DC8; // 4k (vp_38)
	kc_levels_start_vlines	= [ $a3c,$a46,$a4F,$a59,$a62,$a6c,$a75,$a7f]; // each stage is 10 bytes long
	kc_levels_start_hlines	= [ $a45,$a4e,$a58,$a61,$a6b,$a74,$a7e,$a87]; // each stage is 9 bytes long

	// K.C. KRAZY CHASE
	kc2crcPAL				= $A6909A8B; // 4k (vp_44)
	
	loadedrom = -1;
	size4k	= $1000; // expected rom size
	size8k	= $2000; // expected rom size
	samplerom_totalsize		= [size4k, size8k];
	romtype					= -1;    // -1=invalid // 0=4k // 1=8k
	currentlevel			= 0; // level being edited
	assets_level			= [ // current level being edited (viewed sideways
							// and mirrored since the first 8 entries are the first column, and so on)
	1,0,0,0,0,0,0,0,
	0,1,0,0,0,0,0,0,
	0,1,1,0,0,0,0,0,
	0,1,0,1,0,0,0,0,
	0,1,0,0,1,0,1,1,
	0,1,0,0,0,1,1,1,
	0,0,1,0,0,0,1,1,
	0,0,1,0,0,0,0,0,
	1,0,1,0,0,0,0,0];

	rompokeinterval = 10;
	rompokemininterval = 5;

	loadedROM = "load a rom please";

	framecount = 0;
	clickdelay = 10; // use this to avoid multiple unwanted clicking
					 // (reset framecount to 0 when you want it, then compare to delay)

	//debug = !public;
	bufferminimize = false;
	dragging = false;
	screenwid = 160;
	screenhei = 120;

	popup = false; // used so the UI can know if there's a popup mode

	SetFont();

	ScreenInit(); // default screen settings, set low res surface

	UIColorsInit();
	UIUnitsInit();
	UIDataInit();

	AssetsDataInit();

	// this is used to layer UI elements on top of each other and
	// have the mouse click work only on those that belong to the current layer
	popuplevel = 0;

	ModulesInit();
	UICreate();

	//LoadRomFile("pete.bin")
	//CrcRestore();

	room_goto_next();


}
