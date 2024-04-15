function SaveLevel() {
	// saves level to buffer only, not file

	with g
	{
		var offset = currentlevel * 9;

		for (var j = 0; j < array_length_1d(assets_level); j+=8)
		{
	
			var bit0 = assets_level[j+0] << 0;
			var bit1 = assets_level[j+1] << 1;
			var bit2 = assets_level[j+2] << 2;
			var bit3 = assets_level[j+3] << 3;
			var bit4 = assets_level[j+4] << 4;
			var bit5 = assets_level[j+5] << 5;
			var bit6 = assets_level[j+6] << 6;
			var bit7 = assets_level[j+7] << 7;
	
			var byte = 
			bit0 +
			bit1 +
			bit2 +
			bit3 +
			bit4 +
			bit5 +
			bit6 +
			bit7;
	
			buffer_seek( buffer_rom[romtype], buffer_seek_start, pete_hlines_start[romtype] + offset + (j/8));
			buffer_write(buffer_rom[romtype], buffer_u8, byte)
		}
	}


}
