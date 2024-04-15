function LoadRomFile(argument0) {

	//var filename = get_open_filename(argument0, 0);
	var file = file_bin_open(argument0, 0);
	//var namnum = argument1;


	var size = file_bin_size(file);
		 if size == size4k {			romtype = 0; loadedROM = "UNKNOWN 4K";} // preset the rom name in case later it's not recognized
	else if size == size8k {			romtype = 1; loadedROM = "UNKNOWN 8K";}
	else{show_debug_message("ERROR wrong size!");	romtype = -1; 	exit; }

	file_bin_seek(file, 0);

	var start = 0;

	buffer_seek( buffer_rom[romtype], buffer_seek_start, 0);

	// transfer data to buffer
	for (var i = start; i < size + start; i++)
	{
		file_bin_seek(file, i);
		if i == pete_hlines_start[romtype]
		{
		
		}
		var val = file_bin_read_byte(file);
	
		// write to asset (remove this)
		//assets_ppumem[ i + ( ppu_size_chr0 * argument0 ) ] = val;
	
		// write to buffer
		buffer_write( buffer_rom[romtype], buffer_u8, val );
	}

	loadedrom = argument0;

	var mycrc = Crc32(buffer_rom[romtype]);
		 if mycrc == petecrcPLUSNTSC loadedROM = "VP+ NTSC 8K";
	else if mycrc == petecrcPLUSPAL	loadedROM = "VP+ PAL 8K";
	else if mycrc == petecrcPAL		loadedROM = "VP PAL 4K";
	// else it is unchanged

	LoadLevel();

	//active_nams[argument1] = array_length_1d(assets_nams)-1;

	/*
	var mirrornam;
	if mirroring == 0
	{
			 if namnum == 0 mirrornam = 1;
		else if namnum == 1 mirrornam = 0;
		else if namnum == 2 mirrornam = 3;
		else				mirrornam = 2;
		active_nams[mirrornam] = array_length_1d(assets_nams)-1;
	}
	else if mirroring == 1
	{
			 if namnum == 0 mirrornam = 2;
		else if namnum == 1 mirrornam = 3;
		else if namnum == 2 mirrornam = 0;
		else				mirrornam = 1;
		active_nams[mirrornam] = array_length_1d(assets_nams)-1;	
	}*/

	file_bin_close(file);


}
