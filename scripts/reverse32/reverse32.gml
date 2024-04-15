function reverse32(argument0) {
	//@arg	n

	var _n;
	_n = argument0;
	_n = (_n & $55555555) <<  1 | (_n & $AAAAAAAA) >>  1;
	_n = (_n & $33333333) <<  2 | (_n & $CCCCCCCC) >>  2;
	_n = (_n & $0F0F0F0F) <<  4 | (_n & $F0F0F0F0) >>  4;
	_n = (_n & $00FF00FF) <<  8 | (_n & $FF00FF00) >>  8;
	_n = (_n & $0000FFFF) << 16 | (_n & $FFFF0000) >> 16;
	return _n;


}
