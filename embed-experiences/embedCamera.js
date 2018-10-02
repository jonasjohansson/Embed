var SCREEN_WIDTH = window.innerWidth,
	SCREEN_HEIGHT = window.innerHeight;

var data;
var params;

if (location.href.includes('?')) {
	params = location.href.split('?')[1].split('&');
	data = {};
	for (attr in params) {
		data[params[attr].split('=')[0]] = params[attr].split('=')[1];
	}
}

data = {
	w: 3530,
	h: 2570,
	d: 2660
};

var options = {
	camera: {
		index: 6,
		panorama: true
	}
};

const P1 = 1 / 4;
const P2 = 1 / 3;
const P3 = 1 / 2;
const P4 = 1 / 1.5;
const P5 = 1 / (1 + P2);

var r1 = data.d / data.h;
var r2 = data.w / data.h;
var sideW = SCREEN_WIDTH - SCREEN_WIDTH / r1;
var frontW = SCREEN_WIDTH - SCREEN_WIDTH / r2;

const setupEmbedCamera = (scene = null, renderer = null) => {
	if (scene === null || renderer === null) {
		console.error('Missing Scene or Renderer!');
		return;
	}

	camera = new THREE.CubeCamera(0.1, 200000, 128);
	scene.add(camera);
	// camera.rotation.x = Math.PI;
	camera.scale.y = -1;

	let i = 0;

	for (let cam of camera.children) {
		cam.index = i++;
	}

	// 0 = left
	// 1 = right
	// 2 = bottom
	// 3 = top
	// 4 = back
	// 5 = front

	var gui = new dat.GUI();
	// var cam = gui.addFolder('Camera');
	gui.add(options.camera, 'index', 0, 6, 1).listen();
	gui.add(options.camera, 'panorama').listen();
	// cam.open();

	return camera;
};

const renderEmbedCamera = (camera = null) => {
	if (camera === null) return;

	let index = options.camera.index;
	let panorama = options.camera.panorama;

	if (index != 6) {
		renderer.setViewport(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		renderer.setScissor(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		renderer.setScissorTest(false);
		renderer.render(scene, camera.children[options.camera.index]);
		return;
	}

	for (let cam of camera.children) {
		switch (cam.index) {
			case 0:
				v = [
					0,
					P2 * SCREEN_HEIGHT,
					P1 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT
				];
				if (panorama)
					v = [0, 0, (SCREEN_WIDTH * P1) / r1, SCREEN_HEIGHT];
				break;
			case 1:
				v = [
					P3 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT,
					P1 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT
				];
				if (panorama)
					v = [
						SCREEN_WIDTH * P1 * 2,
						0,
						(SCREEN_WIDTH * P1) / r1,
						SCREEN_HEIGHT
					];
				break;
			case 2:
				v = [
					P1 * SCREEN_WIDTH,
					P4 * SCREEN_HEIGHT,
					P1 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT
				];
				if (panorama) v = [0, 0, 0, 0];
				cam.rotation.z = Math.PI;
				break;
			case 3:
				v = [
					P1 * SCREEN_WIDTH,
					0,
					P1 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT
				];
				if (panorama)
					v = [
						SCREEN_WIDTH * P1 * 3,
						0,
						(SCREEN_WIDTH * P1) / r2,
						SCREEN_HEIGHT
					];
				cam.rotation.z = Math.PI;
				break;
			case 4:
				v = [
					P5 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT,
					P1 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT
				];
				if (panorama) v = [0, 0, 0, 0];
				break;
			case 5:
				v = [
					P1 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT,
					P1 * SCREEN_WIDTH,
					P2 * SCREEN_HEIGHT
				];
				if (panorama)
					v = [
						SCREEN_WIDTH * P1,
						0,
						(SCREEN_WIDTH * P1) / r2,
						SCREEN_HEIGHT
					];
				break;
		}

		renderer.setViewport(v[0], v[1], v[2], v[3]);
		renderer.setScissor(v[0], v[1], v[2], v[3]);
		renderer.setScissorTest(true);
		renderer.render(scene, cam);
	}
};

window.addEventListener('load', () => {
	document.body.style.margin = 0;
});

window.addEventListener('resize', () => {
	SCREEN_WIDTH = window.innerWidth;
	SCREEN_HEIGHT = window.innerHeight;
	// camera.updateProjectionMatrix();
	camera.aspect = SCREEN_WIDTH / SCREEN_HEIGHT;
	renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
	console.log(
		'Window dimensions updated. Width:',
		SCREEN_WIDTH,
		'Height:',
		SCREEN_HEIGHT
	);
});
