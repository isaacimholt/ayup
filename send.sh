#!/bin/bash

# --------------------------------------------------
# Run this script from computer A to send files to computer B
# --------------------------------------------------

# load config.yaml variables (yaml levels are separated by underscores)
source _lib.sh
eval $(parse_yaml config.yaml)
verify_param sender_rsync_destination
verify_param sender_rsync_source


rsync -avh \
    --progress \
    --partial-dir=__partially_transferred_files__/ \
    --remove-source-files \
    $sender_rsync_source \
    $sender_rsync_destination