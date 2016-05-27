module.exports.distributeElements = {
  evenly: (options) ->
    if !options.elements
      throw new Error "You need to pass distributeElements.auto an array of elements"

    defaults =
      direction: "vertical"
      startOffset: 0
      increment: 500
      reverse: false

    options = Object.assign({}, defaults, options)

    offset = options.startOffset
    if options.reverse == true then options.increment *= -1
    for index, element of options.elements
      if options.direction == "vertical"
        element.y += offset
      else
        element.x += offset
      offset += options.increment

  fit: (options) ->
    if !options.elements
      throw new Error "You need to pass distributeElements.auto an array of elements"

    defaults =
      direction: "vertical"
      startX: 0
      margin: 0
      reverse: false

    offset = options.startOffset
    for index, element of options.elements
      if options.direction == "vertical"
        element.y += offset
        offset += element.height + options.margin
      else
        element.x += offset
        offset += element.width + options.margin

    options = Object.assign({}, defaults, options)



}
