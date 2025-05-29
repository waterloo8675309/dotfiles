#!/usr/bin/env bash
pactl load-module module-combine-sink slaves=alsa_output.pci-0000_00_1b.0.analog-stereo,alsa_output.usb-Jabra_Speak_410-00.analog-stereo \
            sink_name=combined channels=2
pacmd set-default-sink combined
