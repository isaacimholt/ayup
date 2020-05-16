# ayup
 automatic youtube uploader pipeline

## Abstract
It is assumed that the user has 2 computers on a LAN and wishes to transfer video files from one (A) to the other (B), where files are deleted from A after transfer to B, and deleted from B once upload to youtube is successful.

## Configuration
All settings are stored in a `config.yaml` file that you must create. Here is a template:

```YAML
# config values for sender (send.sh)
sender:
  rsync:
    source: /folder/with/videos/to/send
    destination: my_user@my_other_computer:/folder/on/other/computer
```