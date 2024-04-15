function BtScrPokeSave() {

	//SaveLevel();

	var size = buffer_get_size(g.buffer_rom[g.romtype]);
	for (var i = 0; i < size ; i += g.rompokeinterval)
	{
		var filetowrite = file_bin_open(working_directory + "poke_" + string(i) + ".bin", 2);
		// copy rom
		buffer_seek( g.buffer_rom[g.romtype], buffer_seek_start, 0);
		for (var j = 0; j < g.samplerom_totalsize[g.romtype]; j++)
		{
			var data = buffer_read( g.buffer_rom[g.romtype], buffer_u8 );
			if j == i
			{
				if data != 0 data = 0;
				else data = $ff;
			}
			file_bin_seek( filetowrite, j );
			file_bin_write_byte( filetowrite, data );
		}
	
		// done
		file_bin_close(filetowrite);
	}


}
