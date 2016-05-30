# Distribute Layers for Framer
[Installation](https://#) &bullet; [Usage](https://#) &bullet; [Code Examples](https://#) &bullet; [Full documentation](https://#)
*******

**This package helps you position multiple Framer layers with ease.**

It's similar to these buttons…

![](https://cloud.githubusercontent.com/assets/875708/15651127/dc96b49c-267d-11e6-986d-199d9ba80003.png) 

…that you know and love 😍.

**You can position layers in three ways:**

Evenly | Fit | Equally
---|---|---
The layers are positioned every nth pixel, regardless of their height. <img src="http://placehold.it/250x10/ffffff/ffffff"><img src="https://cloud.githubusercontent.com/assets/875708/15650429/c6f44cda-2678-11e6-8da0-dca69880a7d4.gif" width="250">| The layers follow each other with a constant ```margin``` between them. <img src="http://placehold.it/250x10/ffffff/ffffff"><img src="https://cloud.githubusercontent.com/assets/875708/15650431/c71e34fa-2678-11e6-8a2a-52b03d965d82.gif" width="250"> | The layers fill upp the space. The spacing between them is equal. <img src="http://placehold.it/250x10/ffffff/ffffff"><img src="https://cloud.githubusercontent.com/assets/875708/15650430/c70e0b3e-2678-11e6-8a6e-5a7dd9f4a4fd.gif" width="250">

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

distributeLayers.evenly
	layers: layers
```

## Arguments
All functions accept one argument: an options object. The functions can be called with the following arguments:

Name | Type | Required | Description
---|---|---|---
layers | array | yes | An array containing the layers you want to distribute.
direction | string | no | **"Horizontal"** or **"vertical"**. Defaults to vertical.
startOffset | int | no | X/Y starting point for the first layer. X when **direction** is "horizontal", Y when **"vertical"**.

#### distributeLayers.evenly()
distributeLayers.evenly() accepts these additional parameters:

Name | Type | Required | Description
---|---|---|---
increment | int | yes | How much space to add between each layer.

#### distributeLayers.fit()
distributeLayers.fit() accepts these additional parameters:

Name | Type | Required | Description
---|---|---|---
margin | int | no | Margin between each layer.
