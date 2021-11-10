#!/bin/bash

# Redirect stdout & stderr
exec >> /var/log/amc/amc.txt
exec 2>&1

# Variables
OUTPUT_DIR="/mnt/driveA/Media"
INPROGRESS_DIR="/mnt/driveA/Media/Uncategorized/InProgress"
COMPLETE_DIR="/mnt/driveA/Media/Uncategorized/Complete"

echo "======================================="
if    ls -1qA $COMPLETE_DIR | grep -q .
then
        filebot -script fn:amc --output "$OUTPUT_DIR" --action move --conflict skip -non-strict "$COMPLETE_DIR" --l>else
        echo $COMPLETE_DIR is empty
fi