#! /bin/bash
# Uses ImageMagick, Xdialog

if [ "$#" -eq 0 ]; then
    echo "Usage: resizeMagick <Input file>"
    exit
fi

Xdialog --inputbox "Input Percentage" 10 40 2>/tmp/resizemagick.perc.tmp
percentage=`cat /tmp/resizemagick.perc.tmp`
percentage="${percentage//'%'}"

for var in "$@" do
    filename=$(basename "$var")
    extension="${filename##*.}"
    filenameNoExtension="${filename%.*}"

    convert "$filename" -resize "$percentage"% "$filenameNoExtension"_resized."$extension"
done
