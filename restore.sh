#!/bin/bash

set -e  # Exit on error

REPO_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Symlink helper
link_config() {
  local src="$1"
  local dest="$2"
  echo "🔗 Linking $src → $dest"
  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
}

echo "🔁 Restoring configuration files..."

# Core configs
link_config "$REPO_DIR/.zshrc" "$HOME/.zshrc"
link_config "$REPO_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

# WM and UI configs
link_config "$REPO_DIR/config/sway" "$CONFIG_DIR/sway"
link_config "$REPO_DIR/config/waybar" "$CONFIG_DIR/waybar"

# Optional: Add local bin folder if needed
mkdir -p "$HOME/.local/bin"

# Bootstrap
echo "🚀 Running bootstrap.sh..."
bash "$REPO_DIR/bootstrap.sh"

echo "✅ Restore complete. Ready for login or reload."
