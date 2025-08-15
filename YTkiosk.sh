#!/usr/bin/env bash

sudo /usr/bin/mountpoint -q /boot || sudo /usr/bin/mount /dev/mmcblk0p1 /boot

CONFIG=/boot/youtubeconfig.txt
if [[ ! -s $CONFIG ]]; then
  echo "Error: $CONFIG missing or empty."
  exit 1
fi

YT_URL=$(< "$CONFIG")

while true; do
  STREAM_URL=$(/home/biz/ytvenv/bin/yt-dlp -f "[height=1080]" -g "$YT_URL")
  mpv --fs "$STREAM_URL"
  echo "mpv exited with code $?; reconnecting in 5s…" >&2
  ffmpeg --vcodec copy --http_persistent 0
  sleep 120
done