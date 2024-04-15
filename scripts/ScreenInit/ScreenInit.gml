function ScreenInit() {
	//var myscreen = room_get_viewport(rm_editor,0);
	//scale = 256/myscreen[3]; // used for camera zoom (internal zoom)
	var myscreen = room_get_viewport(rm_editor,0);
	scale = 2; // used for camera zoom (internal zoom)
	gamewidth = 322; //internal resolution
	gameheight = 270;
	zoom = max(1, floor(display_get_width()/gamewidth) - 1); // sets the zoom to the max possible -1. used for WINDOW scaling
	var zoom2 = max(1, floor(display_get_height()/gameheight) - 1);
	zoom = min (zoom, zoom2);

	// shader settings
	shaders = [shr_normal, shr_normal_CRT]; // list of shaders to cycle
	currshader = 0;
	shader_to_use = shaders[currshader];
	if currshader == 0
	{
		var_distortion_ammount = 0.0;
		distort = 0;
	}
	else
	{
		var_distortion_ammount = 0.1;
		distort = 1;
	}

	vsync = false;

	//fullscreen = public;
	fullscreen = false;


	ScreenConfig();
	window_set_fullscreen(fullscreen);
	// CRT SHADER INIT

	//application_surface_draw_enable(false);

	crt_surface_scale = zoom;

	crt_surface_width  = gamewidth * crt_surface_scale;
	crt_surface_height = gameheight * crt_surface_scale;

	uni_crt_sizes = shader_get_uniform(shader_to_use, "u_crt_sizes");
	distort = shader_get_uniform(shader_to_use, "distort");
	distortion = shader_get_uniform(shader_to_use, "distortion");
	border = shader_get_uniform(shader_to_use, "border");

	var_distort = false;

	var_border = true;

	surface_resize(application_surface, gamewidth, gameheight);





}
