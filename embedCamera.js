var embedRenderer = null;

var SCREEN_WIDTH = window.innerWidth,
    SCREEN_HEIGHT = window.innerHeight;

const setupEmbedCamera = (scene = null, renderer = null) => {

	if (scene === null || renderer === null){
        console.error('Missing Scene or Renderer!');
		return;
    }

    embedRenderer = renderer;

	let embedCamera = new THREE.CubeCamera( 0.1, 200000, 128 );

    let i = 0;

    for (let cam of embedCamera.children){
        cam.index = i++;
    }

	scene.add( embedCamera );

    window.addEventListener('resize', ()=>{
        SCREEN_WIDTH = window.innerWidth;
        SCREEN_HEIGHT = window.innerHeight;
        // embedCamera.aspect = SCREEN_WIDTH/SCREEN_HEIGHT;
        // embedRenderer.setSize(SCREEN_WIDTH,SCREEN_HEIGHT);
        console.log('Window dimensions updated. Width:',SCREEN_WIDTH,'Height:',SCREEN_HEIGHT);
    });

    return embedCamera;

}

const P1 = 1/4;
const P2 = 1/3;
const P3 = 1/2;
const P4 = 1/1.5;
const P5 = 1/(1+P2);

const renderEmbedCamera = (camera = null) => {

	for (let cam of camera.children){

		switch (cam.index) {
			case 0:
				v = [ 1, P2 * SCREEN_HEIGHT + 1, P1 * SCREEN_WIDTH - 2, P2 * SCREEN_HEIGHT - 2 ];
				break;
			case 1:
				v = [ P3 * SCREEN_WIDTH + 1, P2 * SCREEN_HEIGHT + 1, P1 * SCREEN_WIDTH - 2, P2 * SCREEN_HEIGHT - 2 ]
				break;
			case 2:
				v = [ P1 * SCREEN_WIDTH + 1, P4 * SCREEN_HEIGHT + 1, P1 * SCREEN_WIDTH - 2, P2 * SCREEN_HEIGHT - 2 ]
                cam.rotation.z = Math.PI;
				break;
			case 3:
				v = [ P1 * SCREEN_WIDTH + 1, 0, P1 * SCREEN_WIDTH - 2, P2 * SCREEN_HEIGHT - 2 ]
                cam.rotation.z = Math.PI;
				break;
			case 4:
				v = [ P5 * SCREEN_WIDTH + 1, P2 * SCREEN_HEIGHT + 1, P1 * SCREEN_WIDTH - 2, P2 * SCREEN_HEIGHT - 2 ]
				break;
			case 5:
				v = [ P1 * SCREEN_WIDTH + 1, P2 * SCREEN_HEIGHT + 1, P1 * SCREEN_WIDTH - 2, P2 * SCREEN_HEIGHT - 2 ]
				break;
		}

		embedRenderer.setViewport(v[0],v[1],v[2],v[3]);
		embedRenderer.setScissor(v[0],v[1],v[2],v[3]);
		embedRenderer.setScissorTest(true);
		embedRenderer.render( scene, cam );
	}

}