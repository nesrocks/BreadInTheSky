if dirR == 1 {	colR+=spd;	if colR > limitH { colR = limitH - spd; dirR = -1 }}
		else {	colR-=spd;	if colR < limitL { colR = limitL + spd; dirR =  1 }}
if dirG == 1 {	colG+=spd;	if colG > limitH { colG = limitH - spd; dirG = -1 }}
		else {	colG-=spd;	if colG < limitL { colG = limitL + spd; dirG =  1 }}
if dirB == 1 {	colB+=spd;	if colB > limitH { colB = limitH - spd; dirB = -1 }}
		else {	colB-=spd;	if colB < limitL { colB = limitL + spd; dirB =  1 }}
col = make_color_rgb(colR, colG, colB);

framecount++;
if framecount > animdelay*2 framecount = 0;
/*
xx -= spd;
if xx < -text2len xx = 0;

show_debug_message(xx)