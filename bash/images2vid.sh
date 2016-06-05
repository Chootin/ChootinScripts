#! /bin/bash

# images2vid.sh <title of files> <number of digits> <fps> <ouput file name>
# images2vid.sh fout 04 25 output
# fout0001.png -> output.mp4

ffmpeg -framerate $3 -i $1%$2d.png -s:v 1280x720 -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p $4.mp4
