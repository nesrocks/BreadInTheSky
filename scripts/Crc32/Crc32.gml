///crc32( buffer, [offset], [length] )
function Crc32() {
	//  
	//  
	//  Implementation of the CRC-32 algorithm as per the ISO 3309 standard.
	//  Call once at the start of your application to initialise the
	//  look-up table.
	//
	//      buffer     data to hash with CRC32, buffer index
	//      offset     start position, integer, optional
	//      length     length of data to be hashed, integer, optional
	//  
	//  
	//  March 13th '16
	//  @jujuadams, u/JujuAdam
	//  
	/// GMLscripts.com/license

	var i, crc;

	if ( argument_count > 3 ) {
	    show_debug_message( "crc32: Error! Too many arguments!" );
	    exit;
	}

	if ( argument_count == 0 ) {
    
	    var polynomial = $EDB88320;
    
	    for( i = 0; i <= $FF; i++ ) {
	        crc = i;
        
	        repeat( 8 ) {
	            if ( crc & 1 ) {
	                crc = ( crc >> 1 ) ^ polynomial;
	            } else {
	                crc = crc >> 1;
	            }
	        }
        
	        global.crc32table[i] = crc;
        
	    }
    
	    show_debug_message( "crc32: Table formed" );
	    exit;
	}

	var buffer = argument[0]
	if ( argument_count >= 2 ) var a = argument[1] else a = 0;
	if ( argument_count == 3 ) var b = a + argument[2] else b = buffer_get_size( buffer );

	crc = $FFFFFFFF;
	for( i = a; i < b; i++ ) crc = global.crc32table[ ( crc ^ buffer_peek( buffer, i, buffer_u8 ) ) & $FF ] ^ ( crc >> 8 );
	return crc ^ $FFFFFFFF;


}
