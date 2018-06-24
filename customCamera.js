const createCustomCamera = (scene = null, debug = false) => {
	let arr = [];
	for (let i = 0; i < 6; i++){
		let camera = new THREE.PerspectiveCamera( 90, 1, 0.1, 200000 );
		arr.push( camera );
		if (scene && debug){
			camera.updateProjectionMatrix();
			var helper = new THREE.CameraHelper( camera );
			scene.add( helper );
		}
	}

	arr[0].lookAt (new THREE.Vector3(1,0,0));
	arr[1].lookAt (new THREE.Vector3(0,0,1));
	arr[2].lookAt (new THREE.Vector3(-1,0,0));
	arr[3].lookAt (new THREE.Vector3(0,0,-1));
	arr[4].lookAt (new THREE.Vector3(0,1,1));
	arr[5].lookAt (new THREE.Vector3(0,-1,1));
	arr[4].rotation.x = 90 * Math.PI / 180;
	arr[5].rotation.x = -90 * Math.PI / 180;

	return arr;
}

const renderCustomCamera = () => {

	var SCREEN_WIDTH = window.innerWidth, SCREEN_HEIGHT = window.innerHeight;

	// LEFT
	v = [ 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
	renderer.setViewport(v[0],v[1],v[2],v[3]);
	renderer.setScissor(v[0],v[1],v[2],v[3]);
	renderer.setScissorTest(true);
	cameras[0].updateProjectionMatrix();
	renderer.render( scene, cameras[0] );

	// MID
	v = [ 0.25 * SCREEN_WIDTH + 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
	renderer.setViewport(v[0],v[1],v[2],v[3]);
	renderer.setScissor(v[0],v[1],v[2],v[3]);
	renderer.setScissorTest(true);
	cameras[1].updateProjectionMatrix();
	renderer.render( scene, cameras[1] );

	// RIGHT
	v = [ 0.5 * SCREEN_WIDTH + 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
	renderer.setViewport(v[0],v[1],v[2],v[3]);
	renderer.setScissor(v[0],v[1],v[2],v[3]);
	renderer.setScissorTest(true);
	cameras[2].updateProjectionMatrix();
	renderer.render( scene, cameras[2] );

	// BACK
	v = [ 0.75 * SCREEN_WIDTH + 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
	renderer.setViewport(v[0],v[1],v[2],v[3]);
	renderer.setScissor(v[0],v[1],v[2],v[3]);
	renderer.setScissorTest(true);
	cameras[3].updateProjectionMatrix();
	renderer.render( scene, cameras[3] );

	// TOP
	v = [ 0.25 * SCREEN_WIDTH + 1, 0, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
	renderer.setViewport(v[0],v[1],v[2],v[3]);
	renderer.setScissor(v[0],v[1],v[2],v[3]);
	renderer.setScissorTest(true);
	cameras[4].updateProjectionMatrix();
	renderer.render( scene, cameras[4] );

	// BOTTOM
	v = [ 0.25 * SCREEN_WIDTH + 1, 0.66 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
	renderer.setViewport(v[0],v[1],v[2],v[3]);
	renderer.setScissor(v[0],v[1],v[2],v[3]);
	renderer.setScissorTest(true);
	cameras[5].updateProjectionMatrix();
	renderer.render( scene, cameras[5] );

}