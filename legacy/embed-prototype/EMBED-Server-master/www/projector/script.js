import settings from '/modules/settings.js'
import warning from '/modules/warning.js'
import mapping from '/modules/mapping.js'
import server from '/modules/server.js'

const reload = () => {
	window.location.reload()
}

const init = async () => {
	console.log('settings', settings)
	// Wire up the server events
	try {
		await server.init(settings.server)
	} catch (error) {
		warning.show(`Error connecting to server ${settings.server}`)
		setTimeout(reload, 5000)
		throw error
		return
	}
	server.on('reload', reload)

	// Get room config
	let room
	try {
		room = {
			width  : await server.get(`${settings.room}.width`),
			height : await server.get(`${settings.room}.height`)
		}
	} catch (error) {
		warning.show(`Error getting room ${settings.room}`)
		setTimeout(reload, 5000)
		throw error
		return
	}
	if (!room) {
		warning.show(`No data for room ${settings.room}`)
		setTimeout(reload, 5000)
		return
	}
	console.log('room', room)

	mapping.init()
	// Load settings
	mapping.setFade('left', await server.get(`${settings.projector}.fade.left`))
	mapping.setFade('right', await server.get(`${settings.projector}.fade.right`))
	mapping.setFade('top', await server.get(`${settings.projector}.fade.top`))
	mapping.setFade('bottom', await server.get(`${settings.projector}.fade.bottom`))
	mapping.setFilter('brightness', await server.get(`${settings.projector}.filter.brightness`))
	mapping.setFilter('saturate', await server.get(`${settings.projector}.filter.saturate`))
	mapping.setFilter('contrast', await server.get(`${settings.projector}.filter.contrast`))
	mapping.setPerspective('tl', 'x', await server.get(`${settings.projector}.perspective.tl.x`))
	mapping.setPerspective('tl', 'y', await server.get(`${settings.projector}.perspective.tl.y`))
	mapping.setPerspective('tr', 'x', await server.get(`${settings.projector}.perspective.tr.x`))
	mapping.setPerspective('tr', 'y', await server.get(`${settings.projector}.perspective.tr.y`))
	mapping.setPerspective('br', 'x', await server.get(`${settings.projector}.perspective.br.x`))
	mapping.setPerspective('br', 'y', await server.get(`${settings.projector}.perspective.br.y`))
	mapping.setPerspective('bl', 'x', await server.get(`${settings.projector}.perspective.bl.x`))
	mapping.setPerspective('bl', 'y', await server.get(`${settings.projector}.perspective.bl.y`))
	mapping.setTransform('scaleX', await server.get(`${settings.projector}.transform.scale.x`))
	mapping.setTransform('scaleY', await server.get(`${settings.projector}.transform.scale.y`))
	mapping.setTransform('translateX', await server.get(`${settings.projector}.transform.translate.x`))
	mapping.setTransform('translateY', await server.get(`${settings.projector}.transform.translate.y`))
	mapping.setTransformOrigin('x', await server.get(`${settings.projector}.transform.origin.x`))
	mapping.setTransformOrigin('y', await server.get(`${settings.projector}.transform.origin.y`))

	// Apply changes from server
	server.on('change-data', payload => {
		const { key, value } = payload
		switch (key) {
			case `${settings.projector}.fade.left`:
				mapping.setFade('left', value)
				break
			case `${settings.projector}.fade.right`:
				mapping.setFade('right', value)
				break
			case `${settings.projector}.fade.top`:
				mapping.setFade('top', value)
				break
			case `${settings.projector}.fade.bottom`:
				mapping.setFade('bottom', value)
				break
			case `${settings.projector}.filter.brightness`:
				mapping.setFilter('brightness', value)
				break
			case `${settings.projector}.filter.saturate`:
				mapping.setFilter('saturate', value)
				break
			case `${settings.projector}.filter.contrast`:
				mapping.setFilter('contrast', value)
				break
			case `${settings.projector}.perspective.tl.x`:
				mapping.setPerspective('tl', 'x', value)
				break
			case `${settings.projector}.perspective.tl.y`:
				mapping.setPerspective('tl', 'y', value)
				break
			case `${settings.projector}.perspective.tr.x`:
				mapping.setPerspective('tr', 'x', value)
				break
			case `${settings.projector}.perspective.tr.y`:
				mapping.setPerspective('tr', 'y', value)
				break
			case `${settings.projector}.perspective.br.x`:
				mapping.setPerspective('br', 'x', value)
				break
			case `${settings.projector}.perspective.br.y`:
				mapping.setPerspective('br', 'y', value)
				break
			case `${settings.projector}.perspective.bl.x`:
				mapping.setPerspective('bl', 'x', value)
				break
			case `${settings.projector}.perspective.bl.y`:
				mapping.setPerspective('bl', 'y', value)
				break
			case `${settings.projector}.transform.scale.x`:
				mapping.setTransform('scaleX', value)
				break
			case `${settings.projector}.transform.scale.y`:
				mapping.setTransform('scaleY', value)
				break
			case `${settings.projector}.transform.translate.x`:
				mapping.setTransform('translateX', value)
				break
			case `${settings.projector}.transform.translate.y`:
				mapping.setTransform('translateY', value)
				break
			case `${settings.projector}.transform.origin.x`:
				mapping.setTransformOrigin('x', value)
				break
			case `${settings.projector}.transform.origin.y`:
				mapping.setTransformOrigin('y', value)
				break
			case `${settings.room}.content.ready`:
				mapping.display(value)
				break
			case `${settings.room}.content.url`:
				mapping.loadUrl(`${value}?s=${settings.server}&r=${settings.room}&p=${settings.projector}&cachebuster=${Date.now()}`)
				break
		}
	})

}
init()
