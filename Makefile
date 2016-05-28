# Simple Makefile written by Moritz Schulte <mtesseract@silverratio.net>
# providing some rudimentary integration of the PureScript build system.

.PHONY: all build test clean init

all: build

src/js/app.js: src/PureScript/src/* src/PureScript/src/Pebble/* src/PureScript/src/Pebble/UI/*
	rm -f src/js/app.js
	(cd src/PureScript && pulp build -O --to ../js/app.js)

build: build/FPebble.pbw

build/FPebble.pbw: src/js/app.js
	pebble build

test: build/FPebble.pbw
	pebble install --emulator chalk --logs

clean:
	pebble clean
	rm -f src/js/app.js

init:
	(cd src/PureScript && bower install)
