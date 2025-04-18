#!/bin/bash

killall -q polybar
sleep 1
polybar main --config=$HOME/.config/polybar/config.ini &
