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

echo "✅ Dotfiles bootstrap complete."
