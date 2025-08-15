#!/bin/bash
IMAGE_PATH="$1"

if [[ -z "$IMAGE_PATH" ]]; then
  echo "Usage: $0 /tmp/display/img.jpg"
  exit 1
fi

fbi --noverbose -T 1 -a "$IMAGE_PATH"
#to be put in /usr/local/bin/
#make executable w/ sudo chmod +x