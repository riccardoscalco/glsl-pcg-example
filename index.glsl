#version 300 es

precision highp float;
precision highp int;

#pragma glslify: addPadding = require('./lib/add-padding');
#pragma glslify: field = require('./lib/field');

uniform float aspect;
uniform float seed;
uniform float paddingRatio;
uniform float numberOfTilesOnWidth;

in vec2 vUv;
out vec4 color;

void main() {
	// Rescale vUv according to the `aspect` uniform.
	vec2 p = vUv * vec2(aspect, 1.);

	// Rescale according to padding.
	float r = paddingRatio;
	float A = aspect;
	float t = (A * r) / (1. - 2. * r);
	float R = 1. + (2. * t / A) - 2. * t;
	p = p * (1. + 2. * vec2(t) / A) - vec2(t);
	float W = A;
	float H = R;

	// Rescale according tiles of size A / N
	if (numberOfTilesOnWidth > 0.) {
		float N = numberOfTilesOnWidth;
		float cellSize = A / N;
		float M = floor(R / cellSize);
		p.x = p.x / cellSize;
		float R1 = M * cellSize;
		float t1 = (R - R1) / 2.;
		p.y = (p.y - t1) / cellSize;
		W = N;
		H = M;
	}

	// Apply field.
	vec4 f = field(p, W, H, seed);

	// Add padding.
	color = addPadding(f, p, W, H);

	// gl_FragColor = color;
}
