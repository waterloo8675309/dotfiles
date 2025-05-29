#!/usr/bin/env bash
# e.g. two monitors: HDMI-1 left, eDP-1 off, HDMI-2 primary
xrandr --output HDMI-1 --mode 1920x1080 --left-of HDMI-2 \
       --output HDMI-2 --mode 1366x768 --primary \
       --output eDP-1 --off
feh --bg-fill ~/Pictures/wallpapers/*
