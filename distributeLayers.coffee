module.exports.distributeLayers =
	evenly: (options) ->
		if !options.layers
			throw new Error "You need to pass distributeLayers.evenly an array of layers"

		defaults =
			direction: "vertical"
			startOffset: 0
			increment: 500

		options = Object.assign({}, defaults, options)

		offset = options.startOffset

		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
			else
				layer.x = offset
			offset += options.increment

			if !layer.custom then layer.custom = {}
			layer.custom.distributeEvenly =
				type: "fit"

	fit: (options) ->
		if !options.layers
			throw new Error "You need to pass distributeLayers.fit an array of layers"

		defaults =
			direction: "vertical"
			startOffset: 0
			margin: 0


		offset = options.startOffset
		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
				offset += parseInt(layer.height) + options.margin
			else
				layer.x = offset
				offset += parseInt(layer.width) + options.margin

			if !layer.custom then layer.custom = {}
			layer.custom.distributeEvenly =
				type: "fit"

	equally: (options) ->
		if !options.layers
			throw new Error "You need to pass distributeLayers.equally an array of layers"

		defaults =
			direction: "vertical"
			startOffset: 0
			range: 1000

		options = Object.assign({}, defaults, options)

		totalArea = 0

		for index, layer of options.layers
			if options.direction == "vertical"
				totalArea += layer.height
			else
				totalArea += layer.width

		spacing = (options.range - totalArea) / (options.layers.length - 1)

		offset = options.startOffset

		for index, layer of options.layers
			if options.direction == "vertical"
				layer.y = offset
			else
				layer.x = offset
			offset += layer.height + spacing

			if !layer.custom then layer.custom = {}
			layer.custom.distributeEvenly =
				type: "equally"
