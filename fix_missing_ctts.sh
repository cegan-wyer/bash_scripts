#! /bin/bash

# Variables
MEDIA_DIR="/mnt/driveA/Media/"
TMP_DIR="/mnt/driveA/tmp/"
BACKUP_DIR="/mnt/driveA/backups/"
MKVMERGE_OPTS="-d 0 -A -S"
FFMPEG_OPTS="-nostdin -hide_banner -map 1 -map 0 -map -0:v:0 -map -1:v:1 -map_metadata 0 -c copy -tag:v:0 hvc1 -movflags +faststart -f mp4"

find $MEDIA_DIR -name "*.mp4" | while read FILE;
do
    if AtomicParsley "$FILE" -T 1 | grep -q ctts
        then
            true
        else
            BASE_FILE="$(basename "${FILE}" .mp4)"
            WORKING_DIR="$(dirname "${FILE}")/"
            echo "Missing ctts: ${BASE_FILE}"

            echo "Remuxing ${FILE} to ${TMP_DIR}${BASE_FILE}.mkv"
            mkvmerge ${MKVMERGE_OPTS} -o "${TMP_DIR}${BASE_FILE}.mkv" "${FILE}"

            echo "Combining video stream from ${TMP_DIR}${BASE_FILE}.mkv with audio from ${FILE}"
            ffmpeg -i "${FILE}" -i "${TMP_DIR}${BASE_FILE}.mkv" ${FFMPEG_OPTS} "${WORKING_DIR}${BASE_FILE}.fixed.mkv"

            echo "Moving ${FILE} to backup folder"
            mv -v "${FILE}" "${BACKUP_DIR}"
    fi
done