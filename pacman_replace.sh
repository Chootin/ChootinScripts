#! /bin/bash

cd /etc/pacman.d/
if [ -e mirrorlist.pacnew ]; then
	echo Upgrading Pacman Mirrorlist File
	sudo mv mirrorlist mirrorlist.backup
	sudo mv mirrorlist.pacnew mirrorlist
	sudo nano mirrorlist
else 
	echo Nothing to do.
fi
