#! /bin/bash
# Uses ImageMagick

filename=$(basename "$1")
extension="${filename##*.}"
filenameNoExtension="${filename%.*}"

convert "$filename" -resize "$2"% "$filenameNoExtension"_resized."$extension"
