#!/bin/bash
URL=$(wget -qO - http://www.reddit.com/r/wallpapers.rss | grep -Eo "https://?[^&>]+(jpg|png)" | grep -Ev  "(thumbs|icon)" | head -1);
NAME=$(basename "$URL");
FILENAME=~/Pictures/Wallpapers/"$NAME";
if [ -f $FILENAME ]; then
   echo "The file alredy exists."; exit
    else
        wget "$URL" -qO "$FILENAME";
        sleep 1;
        gsettings set org.mate.background picture-filename "$FILENAME"
fi
