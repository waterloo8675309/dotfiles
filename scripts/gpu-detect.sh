#!/usr/bin/env bash
if lspci | grep -qi "HD 3000"; then
  picom --config ~/.config/picom/low-spec.conf &
else
  picom --config ~/.config/picom/full.conf &
fi
