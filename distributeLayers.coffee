module.exports.distributeLayers =

	# Defaults used by every public method
	globalDefaults:
		direction: "vertical"
		startOffset: 0

	# All layers have the same distance from eachother. 50, 100, 150, 200 etc.
	sameDistance: (options) ->

		# Arguments that are unique to this method
		defaults =
			distance: 500

		# Set up options and validate properties
		options = Object.assign({}, this.globalDefaults, defaults, options)
		this._validateOptions(options)

		# Loop through all layers and position them
		offset = options.startOffset
		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
			else
				layer.x = offset
			offset += options.distance

		# Remember which method was used
		this._setLayerMetadata(layer, 'methodUsed', 'sameDistance')

	# Layers follow one another. They are spaced with the same margin.
	sameMargin: (options) ->

		# Arguments that are unique to this method
		defaults =
			margin: 10

		# Set up options and validate properties
		options = Object.assign({}, this.globalDefaults, defaults, options)
		this._validateOptions(options)

		# Loop through all layers and position them
		offset = options.startOffset
		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
				offset += layer.height + options.margin if layer.height > 0
			else
				layer.x = offset
				offset += layer.width + options.margin if layer.width > 0

		# Remember which method was used
		this._setLayerMetadata(layer, 'methodUsed', 'sameMargin')

	# Layers fill up the space between 0 and 'max'. The space
	# between the layers is automatically calculated.
	spaced: (options) ->

		# Arguments that are unique to this method
		defaults =
			max: 1000

		# Set up options and validate properties
		options = Object.assign({}, this.globalDefaults, defaults, options)
		this._validateOptions(options)

		# Calculate the height/width of all layers combined
		totalArea = 0
		for index, layer of options.layers
			if options.direction == "vertical"
				totalArea += layer.height
			else
				totalArea += layer.width

		# Calculate the spacing between each layer
		spacing = (options.max - totalArea) / (options.layers.length - 1)

		# Loop through all layers and position them
		offset = options.startOffset
		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
				offset += layer.height + spacing if layer.height > 0
			else
				layer.x = offset
				offset += layer.width + spacing if layer.width > 0


		# Remember which method was used
		this._setLayerMetadata(layer, 'methodUsed', 'spaced')

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

	# Attaches custom metadata to layers
	_setLayerMetadata: (layer, key, value) ->
		if !layer.custom then layer.custom = {}
		layer.custom.distributeLayers = {}
		layer.custom.distributeLayers[key] = value
