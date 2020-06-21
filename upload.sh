#!/bin/bash

# set -exo pipefail

# --------------------------------------------------
# Run this script from computer B to send files to Youtube
# --------------------------------------------------

# load config.yaml variables (yaml levels are separated by underscores)
source _lib.sh
eval $(parse_yaml config.yaml)
verify_param uploader_logs_folder
verify_param uploader_youtube_privacy
verify_param uploader_youtube_source
verify_param uploader_youtube_source


for file in "$uploader_youtube_source"/*.*; do
    [[ -e $file ]] || continue

    youtube-upload \
    --privacy "$uploader_youtube_privacy" \
    --title "$(basename "$file")" \
    "$file" || exit 1

    mv "$file" /media/pi/Maxtor/temp/ || exit 1
done || exit 1