function AssetsDataInit() {
#macro DEPTH_BGCOLOR 3
#macro DEPTH_SPRITE_BACK 2
#macro DEPTH_BG 1
#macro DEPTH_SPRITE_FRONT 0

	// asset types macros
#macro ASSET_CHR 0
#macro ASSET_PAL 1
#macro ASSET_DAT 2
#macro ASSET_NAM 3
#macro ASSET_SCR 4
#macro ASSET_MAP 5
#macro ASSET_MTT 6
#macro ASSET_MTS 7
#macro ASSET_ANI 8
#macro ASSET_OAM 9
#macro ASSET_VARS 10

	buffer_rom4k = buffer_create(size4k, buffer_fast, 1);
	buffer_rom8k = buffer_create(size8k, buffer_fast, 1);
	buffer_rom = [buffer_rom4k, buffer_rom8k];

	bitmasks = [ $80,$40,$20,$10,$8,$4,$2,$1];


}
