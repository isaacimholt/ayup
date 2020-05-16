#!/bin/bash

# --------------------------------------------------
# Run this script from computer B to send files to Youtube
# --------------------------------------------------

# load config.yaml variables (yaml levels are separated by underscores)
source _lib.sh
eval $(parse_yaml config.yaml)
verify_param uploader_youtube_source


for f in find $uploader_youtube_source -maxdepth 1 -type f; do
    echo "Testing $f file..."
done