///@func	crc32_force(buffer, offset, newcrc
///@arg		buffer
///@arg		offset
///@arg		newcrc
function crc32_force(argument0, argument1, argument2) {

	/*
		Modifies 4 bytes of the provided buffer, starting at the specified offset position, in order to
		force a specific CRC32 for the buffer data.
	
		Returns the original (modified) buffer.
	*/

#macro	POLYNOMIAL	$104C11DB7

	var _raf = argument0;
	var _offset = argument1;
	var _newcrc = reverse32(argument2);

	var _length = buffer_get_size(_raf);
	var _crc = reverse32(Crc32(_raf));
	var _delta = multiply_mod(reciprocal_mod(pow_mod(2, (_length - _offset) * 8)), _crc ^ _newcrc);

	buffer_seek(_raf, buffer_seek_start, _offset);

	var _bytes4 = array_create(4);

	for(var _i = 0; _i < 4; _i++) {
		var _byte = buffer_read(_raf, buffer_u8);
		_bytes4[_i] = _byte ^ ((reverse32(_delta) >> (_i * 8)) & 255);
	}

	buffer_seek(_raf, buffer_seek_start, _offset);

	for(var _i = 0; _i < 4; _i++) {
		buffer_write(_raf, buffer_u8, _bytes4[_i]);
	}

	return _raf;


}
