# Distribute Layers for Framer.js
**This package helps you position multiple Framer layers with ease.** You can position them in two ways:

Evenly | Fit | Equally
---|---|---
The layers are evenly spaced. ![Tightly connected layers](https://cloud.githubusercontent.com/assets/875708/15650429/c6f44cda-2678-11e6-8da0-dca69880a7d4.gif) | The layers follow one another tightly. ![Evenly distributed layers](https://cloud.githubusercontent.com/assets/875708/15650431/c71e34fa-2678-11e6-8a2a-52b03d965d82.gif) | The layers fill upp the space. ![Evenly distributed layers](https://cloud.githubusercontent.com/assets/875708/15650430/c70e0b3e-2678-11e6-8a6e-5a7dd9f4a4fd.gif)

Distribute Layers is a small module that is very easy to use:

![Screenshot from Framer Studio with code example from Distribute Layers](https://cloud.githubusercontent.com/assets/875708/15625770/1a40d56e-24b4-11e6-98ca-e1164fac46e2.jpg)

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
