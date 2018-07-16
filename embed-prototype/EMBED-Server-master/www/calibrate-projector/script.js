import settings from '/modules/settings.js'
import server from '/modules/server.js'

const createSlider = async (set, id, min, max, initial) => {
	const key = `${set}.${id}`
	const serverValue = await server.get(key)
	const value = serverValue || initial
	if (serverValue !== value) {
		await server.set(key, value)
	}

	const container = document.createElement('div')
	container.classList.add('container')
	container.classList.add('slider')
	document.body.appendChild(container)

	const title = document.createElement('div')
	title.classList.add('title')
	container.appendChild(title)
	title.innerHTML = id

	const slider = document.createElement('input')
	container.appendChild(slider)
	slider.type = 'range'
	slider.step = 0.0001
	slider.min = min
	slider.max = max
	slider.value = value

	slider.addEventListener('input',() => {
		const v = slider.value
		number.value = v
		server.set(key, v)
	})

	const number = document.createElement('input')
	container.appendChild(number)
	number.type = 'number'
	number.value = value
	number.min = min
	number.max = max
	number.step = 0.0001

	number.addEventListener('change',() => {
		let v = number.value
		if (v < min || (!v && v !== min)) {
			v = min
			number.value = v
		}
		if (v > max) {
			v = max
			number.value = v
		}
		slider.value = v
		server.set(key, v)
	})

	const minus = document.createElement('button')
	container.appendChild(minus)
	minus.innerHTML = '-'
	const onMinus = (e) => {
		e.preventDefault()
		let v = (parseFloat(number.value) - (max - min) / 100).toFixed(4)
		if (v < min) v = min
		if (v > max) v = max
		slider.value = v
		number.value = v
		server.set(key, v)
	}
	minus.addEventListener('click', onMinus)

	const plus = document.createElement('button')
	container.appendChild(plus)
	plus.innerHTML = '+'
	const onPlus = (e) => {
		e.preventDefault()
		const v = (parseFloat(number.value) + (max - min) / 100).toFixed(4)
		if (v < min) v = min
		if (v > max) v = max
		slider.value = v
		number.value = v
		server.set(key, v)
	}
	plus.addEventListener('click', onPlus)

}

const createList = async (set, id, options, initial) => {
	const key = `${set}.${id}`
	const serverValue = await server.get(key)
	const value = serverValue || initial
	if (serverValue !== value) {
		await server.set(key, value)
	}

	const container = document.createElement('div')
	container.classList.add('container')
	container.classList.add('dropdown')
	document.body.appendChild(container)

	const title = document.createElement('div')
	title.classList.add('title')
	container.appendChild(title)
	title.innerHTML = id

	const list = document.createElement('select')
	container.appendChild(list)
	list.innerHTML = options.map(option =>
		`<option value=${option}>${option}</option>`
	).join('')
	list.value = value

	list.addEventListener('change',() =>
		server.set(key, list.value)
	)
}

const init = async () => {
	console.log('settings', settings)
	const socket = await server.init(settings.server)

	//const playlist = await server.get(`playlist_calibration`)
	//await createList(settings.room, 'content', playlist.map(({ url }) => url), playlist[0].url)

	await createSlider(settings.projector, 'fade.left', 0, 0.5, 0)
	await createSlider(settings.projector, 'fade.right', 0, 0.5, 0)
	await createSlider(settings.projector, 'fade.top', 0, 0.5, 0)
	await createSlider(settings.projector, 'fade.bottom', 0, 0.5, 0)

	await createSlider(settings.projector, 'filter.brightness', 0.5, 1.5, 1)
	await createSlider(settings.projector, 'filter.saturate', 0.5, 1.5, 1)
	await createSlider(settings.projector, 'filter.contrast', 0.5, 1.5, 1)

	await createSlider(settings.projector, 'perspective.tl.x', 0, 2000, 0)
	await createSlider(settings.projector, 'perspective.tl.y', 0, 2000, 0)
	await createSlider(settings.projector, 'perspective.tr.x', 0, 2000, 1000)
	await createSlider(settings.projector, 'perspective.tr.y', 0, 2000, 0)
	await createSlider(settings.projector, 'perspective.br.x', 0, 2000, 1000)
	await createSlider(settings.projector, 'perspective.br.y', 0, 2000, 1000)
	await createSlider(settings.projector, 'perspective.bl.x', 0, 2000, 0)
	await createSlider(settings.projector, 'perspective.bl.y', 0, 2000, 1000)

	await createSlider(settings.projector, 'transform.scale.x', 0.2, 4, 1)
	await createSlider(settings.projector, 'transform.scale.y', 0.2, 4, 1)
	await createSlider(settings.projector, 'transform.translate.x', -1000, 1000, 0)
	await createSlider(settings.projector, 'transform.translate.y', -1000, 1000, 0)
	await createSlider(settings.projector, 'transform.origin.x', 0, 1, 0)
	await createSlider(settings.projector, 'transform.origin.y', 0, 1, 0)
}
init()
