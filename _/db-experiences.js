const Store = require('electron-store');

module.exports = new Store({
    defaults: {
    },
    experiences: [
        {
            name: 'standard',
            author: 'jonas johansson',
            author_url: 'https://jonasjohansson.se/',
            description: 'a standard piece of art',
            type: 'video',
            url: 'https://github.com/embed/experiences/standard/',
            flags: 'motion touch voice camera',
            format: 'panorama'
        }
    ]
});