k#!/bin/bash

echo "🔧 Starting bspwm environment setup..."

# 1. Install required packages
echo "📦 Installing required packages..."
sudo apt update && sudo apt install -y \
  bspwm sxhkd feh picom polybar rofi \
  x11-xserver-utils xterm wget unzip

# 2. Create config directories
mkdir -p ~/.config/{bspwm,sxhkd,picom,polybar,wallpapers}

# 3. Symlink config files
echo "🔗 Linking config files..."

ln -sf ~/dotfiles/config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sf ~/dotfiles/config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf ~/dotfiles/config/picom/picom.conf ~/.config/picom/picom.conf
ln -sf ~/dotfiles/config/polybar/config.ini ~/.config/polybar/config.ini
ln -sf ~/dotfiles/config/polybar/launch.sh ~/.config/polybar/launch.sh
ln -sf ~/dotfiles/config/wallpapers/cyberpunk.jpg ~/.config/wallpapers/cyberpunk.jpg
ln -sf ~/dotfiles/.xinitrc ~/.xinitrc

# 4. Ensure executability
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.xinitrc

# 5. Confirm wezterm or fallback to xterm
if ! command -v wezterm >/dev/null 2>&1; then
  echo "⚠️  wezterm not found. Falling back to xterm in sxhkdrc..."
  sed -i 's/wezterm/xterm/' ~/.config/sxhkd/sxhkdrc
fi

echo "✅ Setup complete. Run 'startx' to launch bspwm."

