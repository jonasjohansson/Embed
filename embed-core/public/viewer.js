var socket = io();


socket.on('load', function (data) {
    load(data);
});

load = (experience) => {
    document.body.classList.add('loading');
    console.log('Loading',experience.title)
    setTimeout(()=>{
        document.body.classList.remove('loading');
        console.log('Loading complete')
    },1000);
}