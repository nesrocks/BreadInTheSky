function BtScrImportRom() {
	var file = get_open_filename_ext("nam file|*.bin;*.dat;*.rom", "", working_directory, "Open a ROM file");
	if file != ""
	{
		with g 
		{
			LoadRomFile(file);
		}
	}



}
