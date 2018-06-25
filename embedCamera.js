/*

todo:

- flip cameras correctly
- optimise render camera code ie. should not be hard coded
- allow for dynamic browser change and width / height update perhaps pass these values to the render function
- instantiate as a class?

*/

var embedCamera = null;

const setupEmbedCamera = (scene = null, debug = false) => {

	if (scene === null)
		return;

	embedCamera = new THREE.CubeCamera( 0.1, 200000, 128 );
	scene.add( embedCamera );

}

const renderEmbedCamera = () => {

	var SCREEN_WIDTH = window.innerWidth, 
			SCREEN_HEIGHT = window.innerHeight;

	let i = 0;

	for (let camera of embedCamera.children){

		switch (i) {
			case 0:
				v = [ 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ];
				break;
			case 1:
				v = [ 0.5 * SCREEN_WIDTH + 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
				break;
			case 2:
				v = [ 0.25 * SCREEN_WIDTH + 1, 0.66 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
				break;
			case 3:
				v = [ 0.25 * SCREEN_WIDTH + 1, 0, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
				break;
			case 4:
				v = [ 0.75 * SCREEN_WIDTH + 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
				break;
			case 5:
				v = [ 0.25 * SCREEN_WIDTH + 1, 0.33 * SCREEN_HEIGHT + 1, 0.25 * SCREEN_WIDTH - 2, 0.33 * SCREEN_HEIGHT - 2 ]
				break;
		}

		renderer.setViewport(v[0],v[1],v[2],v[3]);
		renderer.setScissor(v[0],v[1],v[2],v[3]);
		renderer.setScissorTest(true);
		renderer.render( scene, camera );

		i++;

		}

}