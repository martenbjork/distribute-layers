# Distribute Layers for Framer
[Installation](#installation) &bullet; [Code Examples](#code-examples) &bullet; [Full documentation](#full-documentation)
*******

**This package helps you position multiple Framer layers with ease.**

<img alt="It's a bit like the Distribute Elements buttons in Sketch, but for Framer" src="https://cloud.githubusercontent.com/assets/875708/15664510/c98a726c-2704-11e6-8b20-0c110e1c0ea4.jpg" width="382">

**You can position layers in three ways:**

sameDistance | sameMargin | spaced
---|---|---
The layers are positioned every nth pixel, regardless of their height. <img src="http://placehold.it/250x10/ffffff/ffffff"><img src="https://cloud.githubusercontent.com/assets/875708/15650429/c6f44cda-2678-11e6-8da0-dca69880a7d4.gif" width="250">| The layers follow each other with a constant ```margin``` between them. <img src="http://placehold.it/250x10/ffffff/ffffff"><img src="https://cloud.githubusercontent.com/assets/875708/15650431/c71e34fa-2678-11e6-8a2a-52b03d965d82.gif" width="250"> | The layers fill upp the space. The spacing between them is equal. <img src="http://placehold.it/250x10/ffffff/ffffff"><img src="https://cloud.githubusercontent.com/assets/875708/15650430/c70e0b3e-2678-11e6-8a6e-5a7dd9f4a4fd.gif" width="250">

You ➡️ can ➡️ also ➡️ distribute ➡️ elements ➡️ horizontally.

## Installation
- Download [distributeLayers.coffee](https://raw.githubusercontent.com/martenbjork/distribute-layers/master/distributeLayers.coffee).
- Open your project folder (YourProject.framer). Inside it, there is a modules folder. Put distributeLayers.coffee inside it.
- At the top of your main Framer file, require the package using ```{ distributeLayers } = require "distributeLayers"```
- Reload Framer Studio (or the page)

![Screenshot from Framer Studio with code example from Distribute Layers](https://cloud.githubusercontent.com/assets/875708/15653125/46039b36-268b-11e6-98d4-18a71cf65246.jpg)

## Code examples

```
{ distributeLayers } = require "distributeLayers"

layers = []
layers[0] = new Layer
layers[1] = new Layer
layers[2] = new Layer

distributeLayers.sameDistance
	layers: layers
	distance: 250
```

## Full documentation
All functions accept one argument: an options object. The functions can be called with the following arguments:

Name | Type | Required | Description
---|---|---|---
layers | array | yes | An array containing the layers you want to distribute.
direction | string | no | ```horizontal``` or ```vertical```. Defaults to ```vertical```.
startOffset | int | no | X/Y starting point for the first layer. X when ```direction``` is ```horizontal```, Y when ```vertical```.

#### distributeLayers.sameDistance()
distributeLayers.sameDistance() accepts these additional arguments:

Name | Type | Required | Description
---|---|---|---
distance | int | no | How much space to add between each arguments. Defaults to ```500```.

#### distributeLayers.sameMargin()
distributeLayers.sameMargin() accepts these additional parameters:

Name | Type | Required | Description
---|---|---|---
margin | int | no | Margin between each arguments. Defaults to ```10```.

#### distributeLayers.spaced()
distributeLayers.spaced() accepts these additional parameters:

Name | Type | Required | Description
---|---|---|---
max | int | no | The max area within the layers should be rendered.  Defaults to ```1000```.
