#version 300 es

precision highp float;
in vec3 position;
out vec2 vUv;

void main() {
	gl_Position = vec4(position.xyz, 1.0);
	vUv = gl_Position.xy * 0.5 + 0.5;
}