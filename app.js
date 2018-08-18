var scene, renderer;
var sphere;
var clock = new THREE.Clock();
let embedCamera = null;

window.onload = () => {

	scene = new THREE.Scene();

	scene.background = new THREE.CubeTextureLoader()
		.setPath( 'images/' )
		.load( [
			'dawnmountain-xpos.png',
			'dawnmountain-xneg.png',
			'dawnmountain-ypos.png',
			'dawnmountain-yneg.png',
			'dawnmountain-zpos.png',
			'dawnmountain-zneg.png'
		] );

	renderer = new THREE.WebGLRenderer();
	renderer.setSize ( window.innerWidth, window.innerHeight );
	document.body.appendChild( renderer.domElement );

	sphere = new THREE.Mesh(
		new THREE.SphereGeometry(100,100,20),
		new THREE.MeshBasicMaterial({
			color:0xffffff,
		})
	);

	scene.add(sphere);

	embedCamera = setupEmbedCamera(scene, renderer);
	
	render();

}

function render() {
    angle = clock.getElapsedTime()*0.5;
	sphere.position.set(650*Math.cos(angle), 650*Math.cos(angle), 650*Math.sin(angle));
    embedCamera.rotation.set( Math.PI, Math.sin(angle), 0 );
	renderEmbedCamera( embedCamera );
	requestAnimationFrame( render );
}