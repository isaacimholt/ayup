#!/bin/bash

# initialize variables from config.yaml
source _lib.sh
eval $(parse_yaml config.yaml)

rsync -avh \
    --progress \
    --partial-dir=__partially_transferred_files__/ \
    --remove-source-files \
    $sender_rsync_source \
    $sender_rsync_destination