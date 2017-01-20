#! /bin/bash
# Uses ImageMagick

if [ "$#" -ne 2 ]; then
    echo "Usage: resizeMagick <Input file> <Scale percentage>"
    exit
fi

filename=$(basename "$1")
extension="${filename##*.}"
filenameNoExtension="${filename%.*}"

convert "$filename" -resize "$2"% "$filenameNoExtension"_resized."$extension"
