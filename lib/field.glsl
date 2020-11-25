// https://www.pcg-random.org/
// https://www.shadertoy.com/view/XlGcRh

uint pcg(uint v) {
	uint state = v * uint(747796405) + uint(2891336453);
	uint word = ((state >> ((state >> uint(28)) + uint(4))) ^ state) * uint(277803737);
	return (word >> uint(22)) ^ word;
}

uvec2 pcg2d(uvec2 v) {
	v = v * uint(1664525) + uint(1013904223);

	v.x += v.y * uint(1664525);
	v.y += v.x * uint(1664525);

	v = v ^ (v>>uint(16));

	v.x += v.y * uint(1664525);
	v.y += v.x * uint(1664525);

	v = v ^ (v>>uint(16));

	return v;
}

uvec3 pcg3d(uvec3 v) {

	v = v * uint(1664525) + uint(1013904223);

	v.x += v.y*v.z;
	v.y += v.z*v.x;
	v.z += v.x*v.y;

	v ^= v >> uint(16);

	v.x += v.y*v.z;
	v.y += v.z*v.x;
	v.z += v.x*v.y;

	return v;
}

uvec3 hash(vec2 s) {
	uvec4 u = uvec4(s, uint(s.x) ^ uint(s.y), uint(s.x) + uint(s.y));
	return uvec3(pcg(pcg(u.x) + u.y));
	//return uvec3(pcg2d(u.xy), 0u);
	//return pcg3d(u.xyz);
}

vec4 field (vec2 p, float W, float H) {
	// uvec3 h = hash(p * float(uint(0xffffffff)));
	uvec3 h = hash(p * 1000.);
	return vec4(vec3(h) * (1.0/float(uint(0xffffffff))), 1.0);
}

#pragma glslify: export(field)