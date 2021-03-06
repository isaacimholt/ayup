import logging
import os
from subprocess import run, CalledProcessError
from pathlib import Path

import yaml

# ----------------------------------------
# SET UP LOGGING
# ----------------------------------------
logging.basicConfig(
    filename="upload.log",
    level=logging.INFO,
    format="%(asctime)s.%(msecs)03d %(levelname)s %(module)s - %(funcName)s: %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)

# ----------------------------------------
# LOAD CONFIG
# ----------------------------------------
with open(r"config.yaml") as file:
    # todo: requires PyYAML package
    config = yaml.load(file, Loader=yaml.FullLoader)
    source_dir = config["uploader"]["youtube"]["source"]
    privacy = config["uploader"]["youtube"]["privacy"]

# ----------------------------------------
# GET OLDEST FILES
# ----------------------------------------
files = sorted(
    (f for f in Path(source_dir).iterdir() if f.is_file()),
    key=os.path.getmtime,  # sort by oldest modification
)

# ----------------------------------------
# UPLOAD FILES
# ----------------------------------------
for f in files:

    cmd = ["youtube-upload", "--privacy", privacy, "--title", f.stem, str(f)]

    logging.info(f"Starting upload for {f}.")
    try:
        run(cmd, check=True)  # failed commands raise an exception
    except CalledProcessError:
        logging.exception(f"Encountered exception attempting to upload {f}!")
        raise
    else:
        logging.info(f"Successfully uploaded {f}.")
        f.unlink()
        logging.info(f"Successfully deleted {f}.")
