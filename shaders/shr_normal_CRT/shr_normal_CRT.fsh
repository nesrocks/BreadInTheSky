varying vec2 v_vTexcoord;

// vars for GML use
uniform vec4 u_crt_sizes;
uniform float distortion;
uniform bool distort;
uniform bool border;
float mod_factor;

//defines and functions
#define TEX2D(c) pow(abs(texture2D(gm_BaseTexture, (c))), vec4(inputGamma))          
float PI = 3.141592653589;
float inputGamma = 2.4;
float outputGamma = 2.8;

vec4 scanlineWeights(float dist, vec4 col)
{
    vec4 wid = 1.0 + 2.0 * pow(col, vec4(4.0));
    vec4 weights = vec4(dist * 3.333333);                
    return 0.51 * exp(-pow(abs(weights * sqrt(2.0 / wid)), wid)) / (0.18 + 0.06 * wid);
}

vec2 overscan = vec2(0.99, 0.99);
vec2 aspect = vec2(u_crt_sizes.x/u_crt_sizes.x, u_crt_sizes.y/u_crt_sizes.x);
float cornersize = 0.02;
float cornersmooth = 94.0;
     
float corner(vec2 coord)
{
    coord = (coord - vec2(0.5)) * overscan + vec2(0.5);
    coord = min(coord, vec2(1.0)-coord) * aspect;
    vec2 cdist = vec2(cornersize);
    coord = (cdist - min(coord,cdist));
    float dist = sqrt(dot(coord,coord));
    return clamp((cdist.x-dist)*cornersmooth,0.0, 1.0);
}

vec2 radialDistortion(vec2 coord)
{
    vec2 cc = coord - 0.5;
    float dist = dot(cc, cc) * distortion;
    return (coord + cc * (1.0 + dist) * dist);
}

// main
void main()
{
    vec2 one = 1.0 / u_crt_sizes.xy;
    vec2 _xy;
    
    // distort
	_xy = radialDistortion(v_vTexcoord);
        
    vec2 uv_ratio = fract(_xy * u_crt_sizes.xy) - vec2(0.0);

    float cval = corner(_xy);
    
    _xy = (floor(_xy * u_crt_sizes.xy) + vec2(0.5)) / u_crt_sizes.xy;
    
    vec4 coeffs = PI * vec4(1.0 + uv_ratio.x, uv_ratio.x, 1.0 - uv_ratio.x, 2.0 - uv_ratio.x);
    coeffs = max(abs(coeffs), 1e-6);
    coeffs = 1.0 * sin(coeffs) * sin(coeffs / 2.0) / (coeffs * coeffs);
    coeffs /= dot(coeffs, vec4(1.0));

	// scanlines
    vec4 col  = clamp(coeffs.x * TEX2D(_xy + vec2(-one.x, 0.0))   + coeffs.y * TEX2D(_xy)+ coeffs.z * TEX2D(_xy + vec2(one.x, 0.0)) + coeffs.w * TEX2D(_xy + vec2(2.0 * one.x, 0.0)),   0.0, 1.0);
    vec4 col2 = clamp(coeffs.x * TEX2D(_xy + vec2(-one.x, one.y)) + coeffs.y * TEX2D(_xy + vec2(0.0, one.y)) + coeffs.z * TEX2D(_xy + one)+ coeffs.w * TEX2D(_xy + vec2(2.0 * one.x, one.y)), 0.0, 1.0);
	
	// scanline opacity
    vec4 weights  = scanlineWeights(0.7 * abs(uv_ratio.y) , 1.1 * col);
    vec4 weights2 = scanlineWeights(-0.7 * (1.0 - uv_ratio.y), 1.1 * col2);
	
	mod_factor = v_vTexcoord.x * u_crt_sizes.x * u_crt_sizes.y / u_crt_sizes.z;
	vec3 mul_res  = (col * weights + col2 * weights2).xyz;
	
	//phosphor pixels
	//vec3 dotMaskWeights = mix( vec3(0.00, 0.99, 0.00), vec3(0.0, 1.01, 0.0), floor(mod(mod_factor, 2.0)) ); // green CRT
    //vec3 dotMaskWeights = mix( vec3(0.99, 0.00, 0.00), vec3(1.01, 0.00, 0.0), floor(mod(mod_factor, 2.0)) ); // virtuaboy
    vec3 dotMaskWeights = mix( vec3(1.0, 1.0, 1.0), vec3(1.0, 1.0, 1.0), floor(mod(mod_factor, 1.0)) );
	mul_res *= dotMaskWeights;
    
	// border
    mul_res = pow(abs(mul_res), vec3(1.0 / (2.0 * inputGamma - outputGamma)))* vec3(cval);
	
	// phosphor delay
    gl_FragColor = vec4(mul_res, 0.9); 
}
