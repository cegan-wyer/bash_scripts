#! /bin/bash

# Variables
MEDIA_DIR="/mnt/driveA/Media/"

find $MEDIA_DIR -name "*.mp4" | while read FILE;
do
    if AtomicParsley "$FILE" -T 1 | grep -q ctts
        then
            true
        else
            echo "Missing ctts: ${line}"
    fi
done