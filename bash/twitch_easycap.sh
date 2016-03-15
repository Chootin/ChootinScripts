stream_key=live_########_##############################

#cd ~/Build/somagic-easycap_1.1

sudo somagic-init

sudo somagic-capture --pal --sync=1 | ffmpeg -f rawvideo -thread_queue_size 512 -pix_fmt uyvy422 -video_size 720x576 -i pipe:0 -f pulse -ac 1 -itsoffset -2.0 -thread_queue_size 512 -i alsa_input.pci-0000_00_14.2.analog-stereo -vcodec libx264 -r 25 -s 720x576 -preset medium -acodec libmp3lame -ar 44100 -q:v 3 -b:a 128k -b:v 400k -maxrate 400k -minrate 400k -g 60 -bufsize 400k -pix_fmt yuv420p -vf "yadif" -threads 4 -f flv "rtmp://live.twitch.tv/app/"$stream_key
