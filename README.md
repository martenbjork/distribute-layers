# Distribute Layers for Framer.js
**This package helps you position multiple Framer layers with ease.** You can position them in two ways:

Evenly | Fit
---|---
The layers are evenly spaced. ![Tightly connected layers](https://cloud.githubusercontent.com/assets/875708/15611796/4dd73324-242c-11e6-8c92-286934ce4ea2.png) | The layers follow one another tightly. ![Evenly distributed layers](https://cloud.githubusercontent.com/assets/875708/15611795/4db9ac8c-242c-11e6-8ca2-f9bb46772216.png)

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
