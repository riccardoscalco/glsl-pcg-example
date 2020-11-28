#pragma glslify: prng = require(glsl-pcg-prng)

vec4 field (vec2 p, float W, float H, float seed) {
	//float r = prng(p.x * seed);
	// float r = prng(p * 20.);
	// vec2 r = prng(vec2(p.x * 10., p.y * 10.));
	// vec3 r = prng(vec3(p.x * 10., p.y * 10., seed));
	vec4 r = prng(vec4(p.x * 1000., p.y * 1000., seed, 0.));

	return vec4(r.xyz, 1.);
}

#pragma glslify: export(field)
