# ayup
 automatic youtube uploader pipeline

 This is just a personal script to manage some youtube videos. It is assumed that the user has 2 computers on a LAN and wishes to transfer video files from one (A) to the other (B), where files are deleted from A after transfer to B, and deleted from B once upload to youtube is successful.

## Dependencies
Most of these should already be present on both systems. It goes without saying that both computers must have access to a unix shell.

### Sender (A)
- `git`
- `rsync`

### Uploader (B)
- `flock` *(used for cron job)*
- `git`
- `python 2/3`
- `rsync`
- [`youtube-upload`](https://github.com/tokland/youtube-upload) *(follow [install instructions](https://github.com/tokland/youtube-upload#install) described there)*

#### Notes
May need to install pyside on raspberry pi, which requires some other packages, see this answer: https://stackoverflow.com/a/51273560 and remove any packages from that list that are not found (e.g. `E: Unable to locate package qtmobility-dev`).

## Install
1) clone this repository from https://github.com/isaacimholt/ayup.git

## Setup

### Configuration
Make sure to follow `youtube-upload` setup instructions. All `ayup` settings are stored in a `config.yaml` file that you must create. Here is a template:

```YAML
# config values for sender (send.sh)
sender:
  rsync:
    source: /folder/with/videos/to/send
    destination: my_user@my_other_computer:/folder/on/other/computer
uploader:
  youtube:
    source: /folder/with/videos/to/upload
```

## Run

*todo*

## Updating
Enter the `ayup` directory and run `git pull`