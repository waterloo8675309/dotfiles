#!/bin/bash

# Set variables
REPO_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Symlink helper
link_config() {
  local source="$1"
  local target="$2"
  echo "Linking $source → $target"
  mkdir -p "$(dirname "$target")"
  ln -sf "$source" "$target"
}

# Symlink starship config
link_config "$REPO_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

# Symlink wezterm config
link_config "$REPO_DIR/wezterm/wezterm.lua" "$CONFIG_DIR/wezterm/wezterm.lua"

# Symlink .zshrc
link_config "$REPO_DIR/.zshrc" "$HOME/.zshrc"

# Add ~/.local/bin to PATH if not already there
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.zshrc"
fi

# Make Zsh the default shell (if not already)
if [[ "$SHELL" != "$(which zsh)" ]]; then
  echo "Changing default shell to Zsh..."
  chsh -s "$(which zsh)"
fi

# Link WezTerm launcher
mkdir -p "$HOME/.local/share/applications"
link_config "$REPO_DIR/applications/wezterm.desktop" "$HOME/.local/share/applications/wezterm.desktop"

# -----------------------------
# Install essential packages
# -----------------------------
sudo apt update && sudo apt install -y \
  jq htop curl wget unzip git \
  wl-clipboard xdg-desktop-portal xdg-desktop-portal-wlr \
  xwayland libxcb-util1 dbus-user-session \
  libinput-bin libseat1 seatd \
  libwayland-dev wayland-protocols \
  swaybg swaylock swayidle \
  rofi wl-clipboard \
  waybar \
  pipewire wireplumber \
  playerctl grim slurp \
  pavucontrol \
  fonts-jetbrains-mono \
  build-essential cmake meson ninja-build \
  libx11-dev libxft-dev libxinerama-dev libxcursor-dev libgl1-mesa-dev libxrandr-dev

# Reload dbus if needed
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  export $(dbus-launch)
fi

echo "✅ Core system packages installed and environment ready."


echo "✅ Dotfiles bootstrap complete."
