const canvasSketch = require('canvas-sketch');
const createShader = require('canvas-sketch-util/shader');
const random = require('canvas-sketch-util/random');
const path = require('path');
const glsl = require('glslify');

// Parameters
const seed = +random.getRandomSeed();
const padding = 100; // In settings.units.
const numberOfTilesOnWidth = 0; // Set to 0 to avoid space tiling.

const settings = {
	dimensions: [1080, 1080],
	units: "px",
	pixelsPerInch: 300,
	context: 'webgl2',
	animate: false,
	name: 'commit',
	suffix: `seed-${seed}`,
	prefix: `${Date.now()}`
};

const frag = glsl(path.resolve(__dirname, 'index.glsl'));
const vert = glsl(path.resolve(__dirname, 'vert.glsl'));

const sketch = ({gl}) => {
	return createShader({
		gl,
		vert,
		frag,
		uniforms: {
			aspect: ({width, height}) => width / height,
			seed: () => seed,
			paddingRatio: ({width}) => padding / width,
			numberOfTilesOnWidth: () => numberOfTilesOnWidth
		}
	});
};

canvasSketch(sketch, settings);
