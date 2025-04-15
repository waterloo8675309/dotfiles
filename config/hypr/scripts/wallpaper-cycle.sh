#!/bin/bash
WALL_DIR="$HOME/Pictures/VaporwaveWallpapers"
INTERVAL=600  # every 10 minutes

while true; do
  PIC=$(find "$WALL_DIR" -type f | shuf -n 1)
  swww img "$PIC" --transition-type any --transition-fps 60 --transition-duration 2
  sleep $INTERVAL
done
