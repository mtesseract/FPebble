// Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
// License: BSD3.

"use strict";

// module Pebble.UI.Card

var UI = require('ui');

exports.newCard = function(cardDef) {
    return (function () { return new UI.Card(cardDef); });
};

exports._newCard = function() {
    return new UI.Card({});
};

exports._setSubtitle = function (cardClass) {
    return (function (card) {
        return (function (s) {
            return (function () { card.state.subtitle = s; });
        });
    });
};

exports._setIcon = function (cardClass) {
    return (function (card) {
        return (function (s) {
            return (function () { card.state.icon = s; });
        });
    });
};

exports._setBody = function (cardClass) {
    return (function (card) {
        return (function (s) {
            return (function () { card.state.body = s; });
        });
    });
};
