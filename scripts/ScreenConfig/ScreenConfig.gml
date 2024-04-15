function ScreenConfig() {
	crt_surface_scale = 1;

	//if public window_set_cursor(cr_none);
	//else
	window_set_cursor(cr_default);

	gpu_set_texfilter(false);
	gpu_set_blendenable(true);
	gpu_set_alphatestenable(false);
	gpu_set_alphatestref(0.0);
	display_reset(0, vsync);
	//gpu_set_texrepeat(true);

	display_set_gui_maximise(zoom, zoom,0,0);
	display_set_gui_size(gamewidth,gameheight);

	window_set_size(gamewidth * zoom, gameheight * zoom);

	alarm_set(0,1); // centers the window 1 frame later



}
