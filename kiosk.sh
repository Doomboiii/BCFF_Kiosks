#!/bin/bash

mountpoint -q /boot || sudo mount /dev/mmcblk0p1 /boot
source /home/biz/kiosk.conf

if [[ -z "$IMAGE_URL" || -z "$IMAGE_PATH" ]]; then
    echo "IMAGE_URL or IMAGE_PATH not set in config file."
    exit 1
fi
while true; do
        IMG_URL=$(cat /boot/urlconfig.txt)
        mkdir -p /tmp/display
        IMG_PATH=/tmp/display/img.jpg
        sleep 2
    wget -q -O "$IMG_PATH" "$IMG_URL"
        sudo /usr/local/bin/show-image.sh "$IMG_PATH"
        sleep 15
    done

#make executable w/ sudo chmod +x