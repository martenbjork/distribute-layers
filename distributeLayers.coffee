distributeLayers =

	globalOptions:
		startOffset: 0
		direction: "vertical"

	globalAnimationOptions:
		time: 0

	sameDistance: (options) ->
		defaults =
			distance: 250
		options = Object.assign {}, this.globalOptions, defaults, options
		this._validateOptions(options)
		animation = Object.assign {}, this.globalAnimationOptions, options.animationOptions

		for i, layer of options.layers
			thisAnimation =
				layer: layer

			if (options.direction == "vertical") then key = "y" else key = "x"
			thisAnimation.properties = {}
			thisAnimation.properties[key] = i * options.distance

			animation = Object.assign {}, animation, thisAnimation
			a = new Animation animation
			a.start()

	sameMargin: (options) ->
		defaults =
			margin: 10
		options = Object.assign {}, this.globalOptions, defaults, options
		this._validateOptions(options)
		if options.direction == "vertical"
			key = "y"
			prop = "height"
		else
			key = "x"
			prop = "width"

		animation = Object.assign {}, this.globalAnimationOptions, options.animationOptions

		currentOffset = options.startOffset
		for i, layer of options.layers
			thisAnimation =
				layer: layer
			thisAnimation.properties = {}
			thisAnimation.properties[key] = currentOffset

			animation = Object.assign {}, animation, thisAnimation
			a = new Animation animation
			currentOffset += layer[prop] + options.margin
			a.start()

	spaced: (options) ->

		defaults =
			max: 1000
		options = Object.assign {}, this.globalOptions, defaults, options
		this._validateOptions(options)

		if options.direction == "vertical"
			key = "y"
			prop = "height"
		else
			key = "x"
			prop = "width"

		animation = Object.assign {}, this.globalAnimationOptions, options.animationOptions

		layersTotalWidthHeight = 0
		for i, layer of options.layers
			layersTotalWidthHeight += layer[prop]

		spaceBetweenEach = (options.max - layersTotalWidthHeight) / options.layers.length

		currentOffset = options.startOffset
		for i, layer of options.layers
			thisAnimation =
				layer: layer

			thisAnimation.properties = {}
			thisAnimation.properties[key] = currentOffset

			animation = Object.assign {}, animation, thisAnimation
			this._validateOptions(options)
			a = new Animation animation
			a.start()

			currentOffset += layer[prop] + spaceBetweenEach

	# Simple validation for options objects. Designed to be beginner-friendly.
	_validateOptions: (options) ->

		if !options.layers
			throw this._error('noLayers')

		if !_.isArray(options.layers)
			throw this._error('layersNotArray')

		if options.layers.length == 0
			throw this._error('layersArrayEmpty')

		if typeof options.margin == "string"
			throw this._error('numberAsString', options.margin)

		if typeof options.startOffset == "string"
			throw this._error('numberAsString', options.startOffset)

	# Throws different errors for different error codes
	_error: (id, value) ->
		err = null
		if id == "numberAsString"
			err = new Error "Don't put quotation marks around numbers. " + "\"" + value + "\" should be written as " + value + "."
		if id == "noLayers"
			err = new Error "You didn't give distributeLayers.layers any value"
		if id == "layersNotArray"
			err = new Error "distributeLayers.layers expects an array"
		if id == "layersArrayEmpty"
			err = new Error "The array that you passed to distributeLayers.layers was empty"
		return err

module.exports.distributeLayers = distributeLayers
