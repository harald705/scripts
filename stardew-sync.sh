#!/bin/sh

RGSP_HOST="root@192.168.0.116"
DECK_DIR="home/deck/.config/"
RGSP_DIR="mnt/SDCARD/xxx"
BACKUP_DIR="home/deck/.config/backup_saves"


backup_saves() {
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    echo "Backing up the saves..."
    cp -r "$DECK_DIR" "$BACKUP_DIR/deck_$timestamp"
}


if [ "$1" = "push" ]; then
    echo "this is push"
    #scp -r "$DECK_DIR" "$RGSP_HOST:$RGSP_DIR"
elif [ "$1" = "pull" ]; then
    echo "this is pull"
    #scp -r "$RGSP_HOST:$RGSP_DIR" "$DECK_DIR"
else
    echo "First argument has to be push or pull"
    exit 1
fi

echo "test123"