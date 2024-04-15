function UIBgDraw() {
	draw_set_color(ArrayGetPos(g.btn_bgcols,BTN_HANDLE));
	draw_rectangle(-2,0,g.gamewidth-1,ArrayGetPos(g.btn_heights,BTN_HANDLE)-1,false);

	//draw_set_color(g.c_lightgray);
	draw_rectangle(0,0,g.gamewidth-1,g.gameheight-1,true);
	draw_rectangle(-2,0,0,g.gameheight-1,false);
	draw_rectangle(g.gamewidth-1,0,g.gamewidth+1,g.gameheight-1,false);

	draw_set_color(ArrayGetPos(g.btn_bgcols,BTN_STATUSBAR));
	draw_rectangle(1,g.gameheight-ArrayGetPos(g.btn_heights,BTN_STATUSBAR)-1,g.gamewidth-2,g.gameheight-2,false);


}
