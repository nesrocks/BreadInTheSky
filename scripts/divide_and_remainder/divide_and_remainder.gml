///@arg	x
///@arg	y
function divide_and_remainder(argument0, argument1) {

	var _x = argument0;
	var _y = argument1;

	if(_x == 0) {
		return [0,0];
	}
	
	var _ydeg = get_degree(_y);
	var _z = 0;
	
	for(var _i = get_degree(_x) - _ydeg; _i > -1; _i--) {
		if(((_x >> (_i + _ydeg)) & 1) != 0) {
			_x = _x ^ (_y << _i);
			_z = _z | (1 << _i);
		}
	}

	return [_z, _x];


}
