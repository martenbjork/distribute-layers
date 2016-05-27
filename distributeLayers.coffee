module.exports.distributeLayers =
  evenly: (options) ->
    if !options.layers
      throw new Error "You need to pass distributeLayers.evenly an array of layers"

    defaults =
      direction: "vertical"
      startOffset: 0
      increment: 500
      reverse: false

    options = Object.assign({}, defaults, options)

    offset = options.startOffset
    if options.reverse == true then options.increment *= -1
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
      reverse: false

    options = Object.assign({}, defaults, options)

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
