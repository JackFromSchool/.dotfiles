#!/usr/bin/env bash

album_art=$(playerctl metadata mpris:artUrl)
if [[ -z $album_art ]]; then
   exit
fi

displayed_album="/tmp/displayed_album"
current_album=$(playerctl metadata album)

if [ -e "$displayed_album" ]; then
   displayed_album=$(cat /tmp/displayed_album)
   if [ "$current_album" = "$displayed_album" ]; then
      skip_curl="yes"
   fi
fi

if [[ -z $skip_curl ]]; then
   curl -s "${album_art}" --output "/tmp/cover.jpeg"
fi
echo "$current_album" > /tmp/displayed_album
echo "/tmp/cover.jpeg"
exit
