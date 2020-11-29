#version 300 es

precision highp float;
precision highp int;

uniform float seed;

in vec2 uv;
out vec4 color;

#pragma glslify: prng = require(glsl-pcg-prng)

void main() {
	vec4 r = prng(vec4(uv.x * 1000., uv.y * 1000., seed, 0.));
	color = vec4(r.xyz, 1.);
}
