var MagicPie = require('nl.fokkezb.magicpie');

var win = Titanium.UI.createWindow({
    backgroundColor: '#fff'
});

var wrapper = Ti.UI.createScrollView({
    layout: "vertical",
    backgroundColor: "#eee",
    top: 0,
    bottom: 50
});
win.add(wrapper);

wrapper.add(Ti.UI.createLabel({
    text: "Regular chart",
    top: 30
}));

var view = MagicPie.createView({
    top: 20,
    width: 200, // '80%',
    height: 200, //Ti.UI.SIZE,
    backgroundColor: "red",
    values: [{
        id: 'b',
        title: "hello",
        color: 'yellow',
        value: 8
    }, {
        id: 'c',
        color: 'blue',
        value: 5
    }, {
        id: 'a',
        color: 'green',
        value: 2
    }]
});

view.addEventListener('selected', function(e) {
    console.info(e);
});

wrapper.add(view);


wrapper.add(Ti.UI.createLabel({
    text: "Donut chart",
    top: 30
}));

var donut = MagicPie.createView({
    top: 20,
    width: 200,
    height: 200,
    minRadius: 25,
    maxRadius: 60,
    showTitles: MagicPie.SHOW_TITLES_ALWAYS,
    values: [{
        itemid: 'b',
        title: "hello",
        color: 'yellow',
        value: 3
    }, {
        id: 'c',
        title: "hello 2",
        color: 'blue',
        value: 4
    }, {
        id: 'a',
        title: "hello 3",
        color: 'green',
        value: 4
    }]
});

donut.addEventListener('selected', function(e) {
    console.info(e);
});

wrapper.add(donut);



wrapper.add(Ti.UI.createLabel({
    text: "gauge chart",
    top: 30
}));

var gauge = MagicPie.createView({
    top: 20,
    width: 200,
    height: 200,
    minRadius: 25,
    maxRadius: 80,
    angles: {
        startAngle: 0,
        endAngle: 180
    },
    showTitles: MagicPie.SHOW_TITLES_IF_ENABLE,
    values: [{
        itemid: 'b',
        title: "hello",
        color: 'yellow',
        value: 3
    }, {
        id: 'c',
        title: "hello 2",
        color: 'blue',
        value: 4
    }]
});

gauge.addEventListener('selected', function(e) {
    console.info(e);
});

wrapper.add(gauge);




var btnChangeVal = Ti.UI.createButton({
    title: "add value",
    width: 100,
    height: 40,
    // left: 0,
    bottom: 5
});
btnChangeVal.addEventListener('click', function(e) {
    view.addValues([{
        itemid: 'bgg',
        color: '#336699',
        value: 2
    }]);
});

win.add(btnChangeVal);


win.open();