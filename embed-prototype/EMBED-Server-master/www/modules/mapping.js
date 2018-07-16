let maptastic
const filters = {
	brightness : 1,
	saturate   : 1,
	contrast   : 1
}
const transforms = {
	scaleX       : 1,
	scaleY       : 1,
	translateX : 0,
	translateY : 0
}
const transformOrigin = {
	x : 0,
	y : 0
}

let frame
const init = async () => {
	// create elements
	const layer = document.createElement('div')
	layer.id = 'layer'
	layer.position = 'relative'
	layer.style.width = screen.width
	layer.style.height = screen.height
	layer.style.overflow = 'hidden'
	document.body.appendChild(layer)

	frame = document.createElement('iframe')
	frame.classList.add('frame')
	frame.style.position = 'absolute'
	frame.style.left = 0
	frame.style.top = 0
	frame.style.width = screen.width
	frame.style.height = screen.height
	frame.style.backgroundColor = 'yellow'
	frame.style.border = 'none'
	frame.style.transformOrigin = 'top left'
	layer.appendChild(frame)

	const left = document.createElement('div')
	left.classList.add('left')
	left.style.backgroundImage = 'linear-gradient(270deg, rgba(0,0,0,0) 0%, rgba(0,0,0,1) 100%)'
	left.style.position = 'absolute'
	left.style.left = 0
	left.style.top = 0
	left.style.width = '100%'
	left.style.height = '100%'
	layer.appendChild(left)

	const right = document.createElement('div')
	right.classList.add('right')
	right.style.backgroundImage = 'linear-gradient(90deg, rgba(0,0,0,0) 0%, rgba(0,0,0,1) 100%)'
	right.style.position = 'absolute'
	right.style.right = 0
	right.style.top = 0
	right.style.width = '100%'
	right.style.height = '100%'
	layer.appendChild(right)

	const top = document.createElement('div')
	top.classList.add('top')
	top.style.backgroundImage = 'linear-gradient(0deg, rgba(0,0,0,0) 0%, rgba(0,0,0,1) 100%)'
	top.style.position = 'absolute'
	top.style.top = 0
	top.style.left = 0
	top.style.width = '100%'
	top.style.height = '100%'
	layer.appendChild(top)

	const bottom = document.createElement('div')
	bottom.classList.add('bottom')
	bottom.style.backgroundImage = 'linear-gradient(180deg, rgba(0,0,0,0) 0%, rgba(0,0,0,1) 100%)'
	bottom.style.position = 'absolute'
	bottom.style.bottom = 0
	bottom.style.left = 0
	bottom.style.width = '100%'
	bottom.style.height = '100%'
	layer.appendChild(bottom)

	// init maptastic
	maptastic = Maptastic({
		autoSave : false,
		autoLoad : false,
		layers   : ['layer']
	})
}

const display = value => {
	const layer = document.getElementById('layer')
	const el = layer.querySelector('.frame')
	if (value) {
		el.style.transition = 'opacity 0.5s'
		el.style.opacity = 1
	} else {
		el.style.transition =  ''
		el.style.opacity = 0
	}
}

const setFilter = (key, value) => {
	value = value || 1
	const layer = document.getElementById('layer')
	const el = layer.querySelector('.frame')
	filters[key] = value
	let style = ''
	for (const name in filters) {
		style += `${name}(${filters[name]}) `
	}
	el.style.filter = style
}
const setTransform = (key, value) => {
	const layer = document.getElementById('layer')
	const el = layer.querySelector('.frame')
	transforms[key] = value
	const {
		scaleX,
		scaleY,
		translateX,
		translateY
	} = transforms
	el.style.transform = `translate3d(${translateX}px,${translateY}px,0) scale3d(${scaleX},${scaleY},1)`
}
const setTransformOrigin = (key, value) => {
	const layer = document.getElementById('layer')
	const el = layer.querySelector('.frame')
	transformOrigin[key] = value
	const {
		x,
		y
	} = transformOrigin
	el.style.transformOrigin = `${x * 100}% ${y * 100}%`
}
const setFade = (key, value = 0) => {
	const layer = document.getElementById('layer')
	const el = layer.querySelector(`.${key}`)
	let property
	switch (key) {
		case 'left':
		case 'right':
			property = 'width'
			break
		case 'top':
		case 'bottom':
			property = 'height'
			break
	}
	el.style[property] = `${value * 100}%`
}
const setPerspective = (corner, axis, value ) => {
	if (value === null) {
		value = 0
	}
	const layout = maptastic.getLayout()

	let cornerIndex
	switch (corner) {
		case 'tl':
			cornerIndex = 0
			break
		case 'tr':
			cornerIndex = 1
			break
		case 'br':
			cornerIndex = 2
			break
		case 'bl':
			cornerIndex = 3
			break
	}

	let axisIndex
	switch (axis) {
		case 'x':
			axisIndex = 0
			break
		case 'y':
			axisIndex = 1
			break
	}
	layout[0].targetPoints[cornerIndex][axisIndex] = value

	maptastic.setLayout(layout)
}

const loadUrl = async url => {
	// after loading first content, force background to be black
	frame.style.backgroundColor = 'black'
	frame.src = url
}

export default {
	init,
	setFade,
	setFilter,
	setPerspective,
	setTransform,
	setTransformOrigin,
	display,
	loadUrl
}
