## ~/.config/sway/theme.conf
# Cyberpunk Theme & Font Settings

# Font
font pango:JetBrainsMono Nerd Font 11

# Wallpaper (adjust path as needed)
exec_always --no-startup-id swaybg -i ~/Pictures/VaporwaveWallpapers/vaporwave-background-afra5ra5l3nu4254.jpg -m fill

# Cursor
seat * xcursor_theme Adwaita 24

# Gaps and Borders
default_border pixel 2
gaps inner 10
gaps outer 10

# Colors (adapted Cyberpunk theme)
client.focused          #52307c #52307c #ffffff #52307c
client.unfocused        #1b1d2b #1b1d2b #999999 #1b1d2b


## ~/.config/sway/binds.conf
# Keybindings for launching and control

set $mod Mod4

# Launch terminal
bindsym $mod+Return exec wezterm start --always-new-process

# Launch app launcher
bindsym $mod+d exec wofi --show drun

# Lock screen
bindsym $mod+L exec ~/.config/sway/scripts/lockscreen.sh

# Reload sway config
bindsym $mod+Shift+c reload

# Exit sway
bindsym $mod+Shift+e exec "swaymsg exit"

# Media and volume keys
bindsym XF86AudioRaiseVolume exec pamixer -i 5
bindsym XF86AudioLowerVolume exec pamixer -d 5
bindsym XF86AudioMute exec pamixer -t

# Brightness keys
bindsym XF86MonBrightnessUp exec brightnessctl set +10%
bindsym XF86MonBrightnessDown exec brightnessctl set 10%-


## ~/.config/sway/autostart.conf
# Autostart applications

# Audio
exec_always --no-startup-id pipewire &
exec_always --no-startup-id wireplumber &

# Bar
exec_always --no-startup-id waybar

# Clipboard
exec_always --no-startup-id wl-paste --watch clipman store &

# Notification daemon (if installed)
exec_always --no-startup-id mako

# Lock screen idle manager (optional)
exec_always --no-startup-id swayidle -w \
  timeout 300 '~/.config/sway/scripts/lockscreen.sh' \
  timeout 600 'swaymsg "output * dpms off"' \
  resume 'swaymsg "output * dpms on"' \
  before-sleep '~/.config/sway/scripts/lockscreen.sh'

# Wallpaper cycle (optional, disable if static wallpaper preferred)
# exec_always --no-startup-id ~/.config/sway/scripts/wallpaper-cycle.sh &


## ~/.config/sway/scripts/wallpaper-cycle.sh
#!/bin/bash

# Description: Cycles wallpapers from a folder every X seconds
WALLPAPER_DIR="$HOME/Pictures/VaporwaveWallpapers"
INTERVAL=600  # 10 minutes

while true; do
  find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) |
    shuf -n 1 |
    xargs -I {} swaybg -i {} -m fill
  sleep $INTERVAL
done


## ~/.config/sway/scripts/lockscreen.sh
#!/bin/bash

# Enhanced lock screen using swaylock-effects
/home/greg/swaylock-effects/build/swaylock \
  --screenshots \
  --clock \
  --indicator \
  --fade-in 0.3 \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --grace 5 \
  --ring-color 52307cff \
  --inside-color 1b1d2bff \
  --line-color 00000000 \
  --separator-color 00000000 \
  --text-color ffffffff \
  --key-hl-color ff6ac1ff \
  --bs-hl-color c792eaff


## ~/.config/sway/config
# Main config file for Sway that includes modular configs

include ~/.config/sway/theme.conf
include ~/.config/sway/binds.conf
include ~/.config/sway/autostart.conf


## ~/.zshrc addition for swaylock-effects path override
export PATH="$HOME/swaylock-effects/build:$PATH"


## ~/.config/waybar/scripts/weather.sh (if applicable)
#!/bin/bash
# Simple placeholder for weather info, customize as needed
echo "🌦️ 72°F - Partly Cloudy"


## ~/.config/waybar/scripts/cpu_temp.sh
#!/bin/bash
# Dynamically locate and display CPU temperature

sensor_file=$(find /sys/class/hwmon/ -type f -name "temp1_input" | grep -E 'hwmon[0-9]')

if [[ -f "$sensor_file" ]]; then
  temp=$(cat "$sensor_file")
  temp_c=$((temp / 1000))
  echo "🌡️ ${temp_c}°C"
else
  echo "🌡️ N/A"
fi


## ~/.config/waybar/config additions (modularized outside canvas)
# Ensure dynamic modules like CPU, temp, network, uptime, etc., are correctly configured
# Dynamic sensor path detection or fallback logic can be built into each script if needed

