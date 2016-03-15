#! /bin/bash

#Use 'xinput list' to find the device number of the tablet should it change

args=("$@");
argLength=${#args[@]}

if [ $argLength == 5 ]; then
    tabletID=$1;
    scaleX=$2;
    scaleY=$3;
    posX=$4;
    posY=$5;

    #Matrix is row major
    xinput set-prop "$tabletID" --type=float "Coordinate Transformation Matrix" $scaleX 0 $posX 0 $scaleY $posY 0 0 1;
else
    echo "limtab <deviceID> <xScale> <yScale> <posX> <posY>"
fi
