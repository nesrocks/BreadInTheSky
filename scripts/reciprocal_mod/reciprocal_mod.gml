///@arg	n
function reciprocal_mod(argument0) {

	var _y = argument0;
	var _x = POLYNOMIAL;
	var _a = 0;
	var _b = 1;

	while(_y != 0) {
		var _dar = divide_and_remainder(_x, _y);
		var _q = _dar[0];
		var _r = _dar[1];
		var _c = _a ^ multiply_mod(_q, _b);
		_x = _y;
		_y = _r;
		_a = _b;
		_b = _c;
	}

	return _a;


}
