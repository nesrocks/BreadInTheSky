function InitRoomViewSize() {
	camera_set_view_size(view_camera[0],g.gamewidth,g.gameheight);
	view_wport[0] = g.gamewidth;
	view_hport[0] = g.gameheight;

	game_set_speed(99999999, gamespeed_fps);


}
