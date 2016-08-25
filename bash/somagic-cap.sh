cd ~/Build/somagic-easycap_1.1
echo "1: 720x576
2: 640x480"
read -n 1 input
if [ $input == "2" ]; then
	input="720x576"
else
	input="640x480"
fi
sudo ./somagic-capture --pal | ffplay -hide_banner -f rawvideo -pixel_format uyvy422 -video_size $input -aspect 4:3 -i pipe:0 -flags2 fast -vf "scale=720/2:480/2" -fast -sync audio -framedrop -infbuf
