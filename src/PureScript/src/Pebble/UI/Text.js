// Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
// License: BSD3.

"use strict";

// module Pebble.UI.Text

var UI = require('ui');
var Vector2 = require('vector2');

exports._newText = function() {
    return new UI.Text({});
};

exports._setPosition = function (textClass) {
    return (function (obj) {
        return (function (v) {
            return (function () { obj.state.position = v; });
        });
    });
};

exports._setSize = function (textClass) {
    return (function (obj) {
        return (function (v) {
            return (function () { obj.state.size = v; });
        });
    });
};

exports._setFont = function (textClass) {
    return (function (obj) {
        return (function (v) {
            return (function () { obj.state.font = v; });
        });
    });
};

exports._setText = function (textClass) {
    return (function (obj) {
        return (function (v) {
            return (function () { obj.state.text = v; });
        });
    });
};
