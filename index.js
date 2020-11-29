const canvasSketch = require('canvas-sketch');
const createShader = require('canvas-sketch-util/shader');
const random = require('canvas-sketch-util/random');
const path = require('path');
const glsl = require('glslify');

// Parameters
const seed = +random.getRandomSeed();

const settings = {
	dimensions: [600, 600],
	units: "px",
	pixelsPerInch: 300,
	context: 'webgl2'
};

const frag = glsl(path.resolve(__dirname, 'frag.glsl'));
const vert = glsl(path.resolve(__dirname, 'vert.glsl'));

const sketch = ({gl}) => {
	return createShader({
		gl,
		vert,
		frag,
		uniforms: {
			seed: () => seed,
		}
	});
};

canvasSketch(sketch, settings);
