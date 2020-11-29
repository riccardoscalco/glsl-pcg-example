#version 300 es

precision highp float;
in vec3 position;
out vec2 uv;

void main() {
	gl_Position = vec4(position.xyz, 1.0);
	uv = gl_Position.xy * 0.5 + 0.5;
}