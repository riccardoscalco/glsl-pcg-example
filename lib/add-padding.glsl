vec4 addPadding (vec4 color, vec2 uv, float a, float b) {
	bool isOutside = (uv.x < 0.) || (uv.x > a) || (uv.y < 0.) || (uv.y > b);

	return isOutside ? vec4(1.) : color;
}

#pragma glslify: export(addPadding)
