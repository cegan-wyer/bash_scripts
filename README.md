# bash_scripts
A collection of useful bash scripts that I have made.

# find_missing_ctts.sh
This script will look through a directory and all its subdirectories to locate any HEVC-encoded MP4 files that are missing the ctts atom.

### Variables
- MEDIA_DIR - the folder that the script will search through.

# fix_missing_ctts.sh
This script will look through a directory and all its subdirectories to locate any HEVC-encoded MP4 files that are missing the ctts atom and then fix them using the following steps:

1. Remux the file into a MKV container
2. Combine the video stream of the MKV file with the audio stream of the MP4 file into a new file
3. Move the old file into a backup folder

### Variables
- MEDIA_DIR - the folder that the script will search through.
- TMP_DIR - the temporary folder to use
- BACKUP_DIR - the folder to put the original files in
- MKVMERGE_OPTS - options to be passed into mkvmerge. Leave this alone if you don't know what you're doing.
- FFMPEG_OPTS - options to be passed into ffmpeg. Leave this alone if you don't know what you're doing.

# amc.sh
This script will check if a directory has any contents, if it does, run filebot against the contents. I have this running in a cron job on the top of every hour.

### Variables
- OUPTUT_DIR - the directory you want FileBot to sort the processed files into (Movies will be put in OUTPUT_DIR/Movies and TV Shows in OUTPUT_DIR/TV Shows)
- INPROGRESS_DIR - currently unused.
- COMPLETE_DIR - the directory that completed torrents are put into, this is the folder filebot will check for content
