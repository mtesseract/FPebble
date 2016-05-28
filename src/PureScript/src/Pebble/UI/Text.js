// Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
// License: BSD3.

"use strict";

// module Pebble.UI.Text

var UI = require('ui');
var Vector2 = require('vector2');

exports._newText = function(textSpec) {
    var p = new Vector2(textSpec.position.x, textSpec.position.y);
    var s = new Vector2(textSpec.size.x, textSpec.size.y);
    var spec = { position: p, size: s, font: textSpec.font,
                 text: textSpec.text }
    return (function () {
        return new UI.Text(spec);
    });
};

