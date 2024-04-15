function BtScrExportNrom() {

	SaveLevel();

	var file;
	file = get_save_filename("pete|*.bin", "pete.bin");
	if file != ""
	{
		var filetowrite = file_bin_open(file, 2);
		
			 if g.samplerom_totalsize[g.romtype] == g.size4k var oldcrc = g.petecrcPAL;
		else if g.samplerom_totalsize[g.romtype] == g.size8k var oldcrc = g.petecrcPLUSPAL;
		else var oldcrc = $C0DEBA5E;
	
			 if g.loadedROM == "VP+ NTSC 8K" oldcrc = g.petecrcPLUSNTSC;
		else if g.loadedROM == "VP+ PAL 8K"  oldcrc = g.petecrcPLUSPAL;
		else if g.loadedROM == "VP PAL 4K"   oldcrc = g.petecrcPAL;
		g.buffer_rom[g.romtype] = crc32_force(g.buffer_rom[g.romtype], g.pete_newcrcarea[g.romtype], oldcrc)
		
		// copy rom
		buffer_seek( g.buffer_rom[g.romtype], buffer_seek_start, 0);
		for (var j = 0; j < g.samplerom_totalsize[g.romtype]; j++)
		{
			var data = buffer_read( g.buffer_rom[g.romtype], buffer_u8 );
			file_bin_seek( filetowrite, j );
			file_bin_write_byte( filetowrite, data );
		}
	
		// done
		file_bin_close(filetowrite);
	}


}
