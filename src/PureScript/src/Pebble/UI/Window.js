// Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
// License: BSD3.

"use strict;"

// module Pebble.UI.Window

var UI = require ('ui');
var Vector2 = require('vector2');

exports._show = function (wClass) {
    return (function (w) {
        return (function () {
            w.show();
        });
    });
};

exports._hide = function (wClass) {
    return (function (w) {
        return (function () {
            w.hide();
        });
    });
};

exports._newWindow = function () {
    return new UI.Window();
};

exports._windowAdd = function (elementClass) {
    return (function (w) {
        return (function (e) {
            return (function () {
                w.add(e);
            });
        });
    });
};

exports._setBackgroundColor = function (windowClass) {
    return (function (card) {
        return (function (s) {
            return (function () { card.state.backgroundColor = s; });
        });
    });
};
