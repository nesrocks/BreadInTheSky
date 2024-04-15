///@arg	x
///@arg	y
function multiply_mod(argument0, argument1) {

	var _x = argument0;
	var _y = argument1;
	var _z = 0;

	while(_y != 0) {
		_z = _z ^ (_x * (_y & 1));
		_y = _y >> 1;
		_x = _x << 1;
		if(((_x >> 32) & 1) != 0) {
			_x = _x ^ POLYNOMIAL;
		}
	}

	return _z;


}
