#!/bin/bash
# minfier.sh (c) 2012, Yigit Genc <yigidix@gmail.com>

SRC="./src"
BUILD="./build"
MINIFIED_PATH="$BUILD"/minified.js
YUI="./yuicompressor-2.4.7.jar"

rm -R $BUILD/*.js

for FILE in `ls "$SRC"`
do
	if [ -e "$SRC/$FILE" ]; then
		MINFILE=${FILE/.js/.min.js}
		echo "Compressing $MINFILE..."
		java -jar "$YUI" "$SRC/$FILE" -o "$BUILD/$MINFILE" --charset utf-8
		echo "/* $MINFILE */" >> $MINIFIED_PATH
		cat "$BUILD/$MINFILE" >> $MINIFIED_PATH
		echo >> $MINIFIED_PATH
		echo >> $MINIFIED_PATH
	fi
done

echo "Minifying process completed!"