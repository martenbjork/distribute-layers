# Distribute Layers for Framer.js
**This package helps you position multiple Framer layers with ease.** You can position them in two ways:

Evenly | Fit
---|---
The layers are evenly spaced. ![Tightly connected layers](https://cloud.githubusercontent.com/assets/875708/15611898/c97e50fc-242c-11e6-89f7-d0d7bed3e19a.png) | The layers follow one another tightly. ![Evenly distributed layers](httpshttps://cloud.githubusercontent.com/assets/875708/15611897/c95fd10e-242c-11e6-9d8c-1d34512dfcab.png)

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

## Arguments
All functions accept one argument: an options object. The functions can be called with the following arguments:

Name | Type | Required | Description
---|---|---|---
layers | array | yes | An array containing the layers you want to distribute.
direction | string | no | **"Horizontal"** or **"vertical"**. Defaults to vertical.
startOffset | int | no | X/Y starting point for the first layer. X when **direction** is "horizontal", Y when **"vertical"**.
reverse | boolean | no | If true, elements will be distributed negatively (up or left). Good when your elements start from the right or bottom corner of the app.

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
