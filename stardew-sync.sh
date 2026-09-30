#!/bin/sh

RGSP_HOST="root@192.168.0.116"
FARM_NAME="Dammhagen_450302910"
DECK_DIR="/home/deck/.config/StardewValley/Saves"
RGSP_DIR="/mnt/sdcard/Roms/Ports (PORTS)/.ports/stardewvalleymainline/savedata/Saves"
BACKUP_DIR="/home/deck/.config/backup_saves"


backup_saves() {
    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    echo "Backing up the saves..."
    cp -r "$DECK_DIR/$FARM_NAME" "$BACKUP_DIR/deck_$timestamp"
    scp -r "$RGSP_HOST:$RGSP_DIR/$FARM_NAME" "$BACKUP_DIR/rgsp_$timestamp"
    echo "Saves are backed up"
}


if [ "$1" = "push" ]; then
    echo "DECK -> RGSP"
    backup_saves
    scp -r "$DECK_DIR/$FARM_NAME" "$RGSP_HOST:$RGSP_DIR"
elif [ "$1" = "pull" ]; then
    echo "RGSP -> DECK"
    backup_saves
    scp -r "$RGSP_HOST:$RGSP_DIR/$FARM_NAME" "$DECK_DIR"
else
    echo "First argument has to be push or pull"
    exit 1
fi

echo "Script finished"
