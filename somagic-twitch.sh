stream_key=live_57081996_OUDve8CsgxYuIzWaUjOg7fcpK66TlS

cd ~/Build/somagic-easycap_1.1
sudo ./somagic-capture --pal | ffmpeg -f rawvideo -pix_fmt uyvy422 -video_size 720x576 -i pipe:0 -f pulse -ac 1 -i default -vcodec libx264 -s 720x420 -preset medium -acodec libmp3lame -ar 44100 -threads 2 -q:v 3 -b:a 128k -b:v 400k -maxrate 400k -minrate 400k -g 60 -bufsize 400k -pix_fmt yuv420p -threads 2 -f flv "rtmp://live.twitch.tv/app/"$stream_key

#ffmpeg -f x11grab -show_region 1 -s 1366x768 -framerate " 30" -i :0.0+0,0 -f pulse -ac 1 -i default -vcodec libx264 -s 1280x720 -preset medium -acodec libmp3lame -ar 44100 -threads 1 -qscale 3 -b:a 128k -b:v 400k -maxrate 400k -minrate 400k -g 60 -bufsize 400k -pix_fmt yuv420p -f flv "rtmp://live.twitch.tv/app/live_57081996_OUDve8CsgxYuIzWaUjOg7fcpK66TlS"
