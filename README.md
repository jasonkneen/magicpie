# MagicPie [![gitTio](http://gitt.io/badge.svg)](http://gitt.io/component/nl.fokkezb.magicpie) [![NPM](https://img.shields.io/npm/v/ti-module-nl.fokkezb.colorpick.svg?style=flat-square)](https://www.npmjs.com/package/ti-module-nl.fokkezb.magicpie)

A Titanium wrapper for [MagicPie](https://github.com/AlexandrGraschenkov/MagicPie).

## Example
See [example/apps.js](example/app.js) to learn by example.

<img src="https://github.com/Sk0rpion/MagicPie/blob/master/MagicPie.gif?raw=true" alt="Demo" width="359" height="704" />

## Get it
Download the latest [distribution](dist) and consult the [Titanium Documentation](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_a_Module) on how install it.

Or use the [gitTio CLI](http://gitt.io/cli) [![gitTio](http://gitt.io/badge.svg)](http://gitt.io/component/nl.fokkezb.magicpie)

`$ gittio install nl.fokkezb.magicpie`

Or NPM [![NPM](https://img.shields.io/npm/v/ti-module-nl.fokkezb.colorpick.svg?style=flat-square)](https://www.npmjs.com/package/ti-module-nl.fokkezb.magicpie)

`$ npm i --save ti-module-nl.fokkezb.magicpie`

## Use it

### Create a pie-view

    var MagicPie = require('nl.fokkezb.magicpie');
    var view = MagicPie.createView({
        width: 200,
        height: 200,
        values: [{
            itemid: 'b',
            title: "hello",
            color: 'yellow',
            value: 8
        }, {
            itemid: 'c',
            color: 'blue',
            value: 5
        }]
    });
    
### Adding a value after creation

    view.addValues([{
        itemid: 'bgg',
        color: '#336699',
        value: 2
    }]);
    
Or replace:
    
    view.setValues([{
        itemid: 'bgg',
        color: '#336699',
        value: 2
    }]);

### Listen to taps on the pie

    view.addEventListener('selected', function(e) {
        console.info(e);
    });

This will give you:

* `e.itemid`: As given for value the user tapped on.
* `e.title`: As given for value the user tapped on.
* `e.value`: As given for value the user tapped on.
* `e.positionx`: Position of tap relative to view.
* `e.positiony`: Position of tap relative to view.
* `e.source`: The pie chart view.

### More options

* `minRadius: 25`: Makes it a donut pie.
* `maxRadius: 80`: Maximum radius (default is to fit in pie view width/height).
* `angles: { startAngle: 0, endAngle: 180 }`: Makes it a partial pie (default is full).
* `showTitles: MagicPie.SHOW_TITLES_IF_ENABLE`: Can be either of `SHOW_TITLES_IF_ENABLE`, `SHOW_TITLES_ALWAYS` or `SHOW_TITLES_NEVER`.

## Credits

* Made by [@viezel](https://github.com/viezel)
* Made for [Timewax](http://www.timewax.com)
