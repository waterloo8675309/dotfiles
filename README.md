way + Waybar Cyberpunk Dotfiles

A modular, stylish, and system-friendly Wayland environment configured around Sway, enhanced with Waybar, swaylock-effects, and themed in a cyberpunk aesthetic. Fully compatible across Linux Mint, Arch, and even legacy hardware (e.g., Panasonic CF-31).

🧩 Modular File Structure

.config/
├── sway/
│   ├── config
│   ├── theme.conf
│   ├── binds.conf
│   ├── autostart.conf
│   └── scripts/
│       ├── lockscreen.sh
│       └── wallpaper-cycle.sh
├── waybar/
│   ├── config
│   ├── style.css
│   └── scripts/
│       ├── cpu_temp.sh
│       └── weather.sh

🎨 Cyberpunk Theming (theme.conf)

Font: JetBrainsMono Nerd Font

Cursor: Adwaita (size 24)

Wallpaper: static or dynamic rotation via wallpaper-cycle.sh

Gaps: Inner + outer gaps for aesthetic spacing

Colors: High contrast focused/unfocused window borders

🎛️ Waybar

Modules: Workspaces, Clock, CPU, Memory, Temperature, Network, Audio, Uptime, Kernel, Weather

Style: Custom style.css with cyberpunk palette

Scripts:

cpu_temp.sh: Auto-detects temp sensor file

weather.sh: Placeholder; ready for API customization

🔐 Lock Screen (swaylock-effects)

Visuals: Blurred background, vignette, indicator, and soft fade-in

Keybind: $mod+L

Script: lockscreen.sh calls the locally built swaylock-effects binary

⚙️ Autostart (autostart.conf)

PipeWire + WirePlumber

Waybar

wl-clipboard integration

Notification daemon (mako)

Idle behavior + lock + screen off

🖱️ Keybindings (binds.conf)

Launch terminal: $mod+Enter

Launch app menu: $mod+d

Reload config: $mod+Shift+c

Exit Sway: $mod+Shift+e

Media + Brightness keys bound to pamixer and brightnessctl

🧠 Smart Features

cpu_temp.sh: Auto-finds working /sys/class/hwmon/... entry

.zshrc: Includes swaylock-effects PATH override

wezterm launched with --always-new-process for session clarity

bootstrap.sh: Automates symlink setup, installs environment

📦 Future Compatibility

Cross-distro (Mint, Arch, Ubuntu)

Works with Wayland-safe apps

Scalable for older devices (tested on EliteBook + CF-31)

Easily extendable (Hyprland configs modularized separately)

🚀 Launch Instructions

exec sway from TTY

Optional: Add Sway to login manager (e.g., SDDM)

Use bootstrap.sh for rapid setup on new machines

🧰 Maintainer Notes

This repo is built to scale. It will remain modular, themed, and hardware-conscious. Expect future enhancements to include:

Scratchpads

HUDs

Audio visualizers

Persistent workspaces

For issues, tweaks, or style expansions, open a dotfile and customize. Every config is fully commented.

Repository Owner: GregBuild Date: April 2025
