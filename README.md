# ayup
 automatic youtube uploader pipeline

## environment
It is assumed that the user has 2 computers and wishes to transfer video files from one (A) to the other (B), where files are deleted from A after transfer to B, and deleted from B once upload to youtube is successful.

## configuration
All settings are stored in a `config.yaml` file that you must create. Here is a template:

```YAML
# config values for sender (send.sh)
sender:
  source_folder: /my/folder/here
  destination_folder
```