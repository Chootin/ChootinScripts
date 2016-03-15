#! /bin/bash

if [ $1 == "--help" ]; then
	echo "listdevices <identifier>";
else
	xinput list | grep -i "$1" | grep -i -o -P "(?<=id=)\d+";
fi;
