// Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
// License: BSD3.

"use strict";

// module Pebble.Lib.Emitter

var Emitter = require('emitter');

exports._connect_2_0 = function (emitterClass) {
    return (function (obj) {
        return (function(sigClass) {
            return (function (sigName) {
                return (function (cb) {
                    return (function () {
                        obj.on (sigClass, sigName, cb);
                    });
                });
            });
        });
    });
};
