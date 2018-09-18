var clock = new THREE.Clock();
var scene = new THREE.Scene();
var renderer = new THREE.WebGLRenderer();

window.onload = () => {

    scene.background = new THREE.Color( 0xa0a0a0 );

     var loader = new THREE.FBXLoader();
     loader.load( document.body.getAttribute('data-src'), function ( object ) {
        object.traverse( function ( child ) {
            if ( child.isMesh ) {
                child.castShadow = true;
                child.receiveShadow = true;
            }
        } );
        scene.add( object );
     } );

    renderer.setPixelRatio( window.devicePixelRatio );
    renderer.setSize ( window.innerWidth, window.innerHeight );
    document.body.appendChild( renderer.domElement );

    embedCamera = setupEmbedCamera(scene, renderer);

    render();
}

function render() {
    angle = clock.getElapsedTime()*0.5;
    embedCamera.rotation.y = Math.sin(angle);
    renderEmbedCamera( embedCamera );
    requestAnimationFrame( render );
}