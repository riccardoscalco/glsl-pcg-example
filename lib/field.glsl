vec4 field (vec2 p, float W, float H) {
	return vec4(p, 1., 1.);
}

#pragma glslify: export(field)