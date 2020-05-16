#!/bin/bash

# --------------------------------------------------
# Run this script from computer B to send files to Youtube
# --------------------------------------------------

# load config.yaml variables (yaml levels are separated by underscores)
source _lib.sh
eval $(parse_yaml config.yaml)
verify_param uploader_youtube_source


for f in $uploader_youtube_source
do
    echo "Testing $f file..."
done