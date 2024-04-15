function MousetoGrid() {
	mxx = (mouse_x - gridinitx)/(gridwid*9);
	if mxx < 0 return -1;
	if mxx >= 1 return -1;
	myy = (mouse_y - gridinity)/(gridhei*8);
	if myy < 0 return -1;
	if myy >= 1 return -1;

	var xx = mxx * 9;
	var yy = myy * 8;

	return floor(yy) + (floor(xx) * 8)    /*
	return yy + (xx * 8);

/* end MousetoGrid */
}
