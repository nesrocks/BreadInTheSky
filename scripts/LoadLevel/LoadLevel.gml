function LoadLevel() {
	if loadedrom == -1
	{
		show_debug_message("trying to load a level from no rom!");
		exit;
	}

	var offset = currentlevel * 9;

	buffer_seek( buffer_rom[romtype], buffer_seek_start, pete_hlines_start[romtype] + offset);
	for (var i = 0; i < 9; i++)
	{
		var byte = buffer_read(buffer_rom[romtype], buffer_u8);
		for (var j = 0; j < 8; j++)
		{
			var testbit = 1 << j;
			if byte & testbit == 0 var bit = 0
			else var bit = 1;
			assets_level[j + (i*8)] = bit;
		}
	}


}
