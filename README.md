# Distribute Layers for Framer.js
This package helps you position multiple Framer layers with ease. You can position them in two ways:

Evenly | Fit
---|---
The layers are evenly spaced. | The layers follow one another tightly.

## Usage

```
{ distributeLayers } = require "distributeLayers"

layers = []
layers[0] = new Layer
layers[1] = new Layer
layers[2] = new Layer

distributeLayers.evenly
	layers: layers
```

## Options
#### distributeLayers.evenly(settings = {})
Name | Type | Required | Description
---|---|---|---
layers | array | yes | An array containing the layers you want to distribute.
direction | string | no | **"Horizontal"** or **"vertical"**. Defaults to vertical.
startOffset | int | no | X/Y starting point for the first layer. X when **direction** is "horizontal", Y when **"vertical"**.
margin | int | no | Margin between each layer.
reverse | boolean | no | If true, elements will be distributed negatively (up or left). Good when your elements start from the right or bottom corner of the app.

#### distributeLayers.fit(settings = {})
Name | Type | Required | Description
---|---|---|---
layers | array | yes | An array containing the layers you want to distribute.
direction | string | no | **"Horizontal"** or **"vertical"**. Defaults to vertical.
startOffset | int | no | X/Y starting point for the first layer. X when **direction** is "horizontal", Y when **"vertical"**.
margin | int | no | Margin between each layer.
reverse | boolean | no | If true, elements will be distributed negatively (up or left). Good when your elements start from the right or bottom corner of the app.
