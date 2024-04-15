function ModulesInit() {
#macro MODULE_NAM 1
#macro MODULE_SCREEN 2
#macro MODULE_CHR 3
#macro MODULE_PALETTE 4
#macro MODULE_METATILES 5
#macro MODULE_MAP 6
#macro MODULE_METASPRITES 7
#macro MODULE_PREVIEW 8

	currentmodule = 1;

	// used for panning
	viewx = 0;
	viewy = 0;

	// used for zooming
	viewz = 1;
	viewzmin = 1;
	viewzmax = 8;

	// used to slow down the effects of a held down key
	repeatcounter = 0;
	repeatmax = 90;


}
