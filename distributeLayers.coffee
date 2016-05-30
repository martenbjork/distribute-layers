module.exports.distributeLayers =

	globalDefaults:
		direction: "vertical"
		startOffset: 0

	sameDistance: (options) ->

		defaults =
			distance: 500

		options = Object.assign({}, this.globalDefaults, defaults, options)
		this._validateOptions(options)

		offset = options.startOffset
		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
			else
				layer.x = offset
			offset += options.distance

		_setLayerMetadata(layer, 'methodUsed', 'sameDistance')

	sameMargin: (options) ->

		defaults =
			margin: 10

		options = Object.assign({}, this.globalDefaults, defaults, options)
		this._validateOptions(options)

		offset = options.startOffset
		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
				offset += layer.height + options.margin
			else
				layer.x = offset
				offset += layer.width + options.margin

		_setLayerMetadata(layer, 'methodUsed', 'sameMargin')

	spaced: (options) ->

		defaults =
			max: 1000

		options = Object.assign({}, this.globalDefaults, defaults, options)
		this._validateOptions(options)

		totalArea = 0
		for index, layer of options.layers
			if options.direction == "vertical"
				totalArea += layer.height
			else
				totalArea += layer.width

		spacing = (options.max - totalArea) / (options.layers.length - 1)
		offset = options.startOffset
		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
			else
				layer.x = offset
			offset += layer.height + spacing

		_setLayerMetadata(layer, 'methodUsed', 'spaced')

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

	_setLayerMetadata: (layer, key, value) ->
		if !layer.custom then layer.custom = {}
		layer.custom.distributeEvenly = {}
		layer.custom.distributeEvenly[key] = vale
