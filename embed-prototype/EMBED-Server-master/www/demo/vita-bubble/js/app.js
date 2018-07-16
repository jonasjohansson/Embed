let canvas
let scene
let camera
let renderer
let uniforms
let controls

EMBED.onplay = () => {
	const start = Date.now()
	const render = () => {
		const now = ((Date.now() - start) * 0.01)
		requestAnimationFrame(render)
		if (canvas.width !== canvas.clientWidth || canvas.height !== canvas.clientHeight) {
			renderer.setSize(canvas.clientWidth, canvas.clientHeight, false)
			camera.aspect = canvas.clientWidth / canvas.clientHeight
			uniforms.uAspect.value = camera.aspect
		}
		uniforms.uTime.value = now * 0.1
		//controls.update()
		renderer.render(scene, camera)
	}
	requestAnimationFrame(render)
}

window.onload = async () => {
	await new Promise(r => setTimeout(r, 2000))
	canvas = document.getElementById('canvas')
	renderer = new THREE.WebGLRenderer({
		preserveDrawingBuffer : true,
		canvas : canvas,
		antialias : true
	})
	camera = new THREE.PerspectiveCamera(30, canvas.clientWidth / canvas.clientHeight, 1, 1e3)
	camera.position.x = 1.398048278662286
	camera.position.y = 0.07262903806286425
	camera.position.z = -3.641463323399695
	camera.up.x = 0.522609150631348
	camera.up.y = 0.8244713609022277
	camera.up.z = 0.21708673549621116

	controls = new THREE.TrackballControls(camera, canvas);
	controls.rotateSpeed = 2.0;
	controls.zoomSpeed = 1.2;
	controls.panSpeed = 0.8;
	controls.noZoom = false;
	controls.noPan = false;
	controls.staticMoving = true;
	controls.dynamicDampingFactor = 0.3;

	const vertexShader = await (await fetch('shader/vert.glsl')).text()
	const fragmentShader = (await (await fetch('shader/optimized.glsl')).text())

	uniforms = {
		uCamPos    : { type: "v3", value: camera.position },
		uCamCenter : { type: "v3", value: controls.target },
		uCamUp     : { type: "v3", value: camera.up },
		uAspect    : { type: "f",  value: canvas.clientWidth / canvas.clientHeight },
		uTime      : { type: "f",  value: 0.0 },
		uGui0      : { type: "f",  value: 0.5 },
		uGui1      : { type: "f",  value: 0.5 },
		uGui2      : { type: "f",  value: 0.5 },
		uGui3      : { type: "f",  value: 0.5 },
		uGui4      : { type: "f",  value: 0.5 },
		uGui5      : { type: "f",  value: 0.5 }
	}

	scene = new THREE.Scene()
	scene.add(new THREE.Mesh(
		new THREE.PlaneGeometry(2, 2),
		new THREE.ShaderMaterial({
			uniforms,
			vertexShader,
			fragmentShader,
			depthWrite: false,
			depthTest: false
		})
	))

	EMBED.ready()
}
