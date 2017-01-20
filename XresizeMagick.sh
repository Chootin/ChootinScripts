#! /bin/bash
# Uses ImageMagick, Xdialog

if [ "$#" -ne 1 ]; then
    echo "Usage: resizeMagick <Input file>"
    exit
fi

filename=$(basename "$1")
extension="${filename##*.}"
filenameNoExtension="${filename%.*}"

Xdialog --inputbox "Input Percentage" 10 40 2>/tmp/resizemagick.perc.tmp
percentage=`cat /tmp/resizemagick.perc.tmp`
percentage="${percentage%}"

convert "$filename" -resize "$percentage"% "$filenameNoExtension"_resized."$extension"
