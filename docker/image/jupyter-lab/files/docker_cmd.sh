#!/bin/bash

if [ -d /mnt/volume ]; then
  sudo chown -R $NB_USER:users /mnt/volume
fi

JUPYTER_ENABLE_LAB=1 start-notebook.sh --NotebookApp.token=''
