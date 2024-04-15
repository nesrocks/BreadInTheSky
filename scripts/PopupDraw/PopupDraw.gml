function PopupDraw() {
	draw_set_color(c_black);
	var border = 0;
	draw_rectangle(1+border,g.handle_height+g.topbar_height+border,g.gamewidth-2-border,g.gameheight/*-g.handle_height*/-border-2,false);
	draw_set_color(col)
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(o2font)
	draw_text(g.gamewidth/2,g.gameheight/2, text);
	//if framecount <= animdelay  draw_text(g.gamewidth/2,g.gameheight-48, text2);
	//else if framecount > animdelay  draw_text(g.gamewidth/2,g.gameheight-48, text3);
	draw_set_valign(fa_top);
	/*
	draw_text(xx*8,g.gameheight-16, text2);
	draw_text((xx*8)+(text2len*8),g.gameheight-16, text2);
	draw_text((xx*8)+(text2len*16),g.gameheight-16, text2);

/* end PopupDraw */
}
