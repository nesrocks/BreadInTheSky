///@arg	x
///@arg	y
function pow_mod(argument0, argument1) {

	var _x = argument0;
	var _y = argument1;
	var _z = 1;

	while(_y != 0) {
		if((_y & 1) != 0) {
			_z = multiply_mod(_z, _x);
		}
		_x = multiply_mod(_x, _x);
		_y = _y >> 1;
	}

	return _z;


}
