const clock = new THREE.Clock();
const scene = new THREE.Scene();
const renderer = new THREE.WebGLRenderer();
// const camera = new THREE.PerspectiveCamera(40, window.innerWidth / window.innerHeight, 1, 1000);

window.onload = () => {
    const src = document.body.getAttribute('data-src');
    const ext = src.split('.').pop();

    switch (ext) {
        case 'mp4':
            video = document.createElement('video');
            video.crossOrigin = 'anonymous';
            video.width = 640;
            video.height = 360;
            video.loop = true;
            video.muted = true;
            video.src = document.body.getAttribute('data-src');
            video.setAttribute('playsinline', true);
            video.play();

            texture = new THREE.VideoTexture(video);
            texture.minFilter = THREE.LinearFilter;
            texture.magFilter = THREE.LinearFilter;
            texture.format = THREE.RGBFormat;
            texture.needsUpdate = true;
            break;
        case 'png':
            loader = new THREE.TextureLoader();
            texture = loader.load(src);
            texture.wrapS = texture.wrapT = THREE.MirroredRepeatWrapping;
            texture.repeat.set(2, 1);
            break;
    }

    texture.flipY = false;

    var geo = new THREE.SphereBufferGeometry(500, 60, 40);
    var mat = new THREE.MeshBasicMaterial({ map: texture });
    geo.scale(-1, 1, 1);

    light = new THREE.HemisphereLight(0xffffff, 0x444444);
    light.position.set(0, 200, 0);
    scene.add(light);

    var sky = new THREE.Mesh(geo, mat);
    // sky.material.side = THREE.BackSide;
    sky.scale.x = -1;
    scene.add(sky);

    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    embedCamera = setupEmbedCamera(scene, renderer);

    render();
};

function render() {
    angle = clock.getElapsedTime() * 0.5;
    embedCamera.rotation.y = Math.sin(angle);
    // renderer.render( scene, camera );
    renderEmbedCamera(embedCamera);
    requestAnimationFrame(render);
}
