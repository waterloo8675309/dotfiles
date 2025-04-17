## Step-by-Step: Set Up SSH for GitHub

### 1. Check for an Existing SSH Key
```bash
ls ~/.ssh/id_ed25519.pub
```
- If this prints a file path, you already have a key. If not, continue below.

### 2. Generate a New SSH Key
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
- Replace `your_email@example.com` with your GitHub email.
- When prompted:
  - Press `Enter` to accept the default file location
  - Choose a **secure passphrase** or press `Enter` for no passphrase

### 3. Start the SSH Agent and Add the Key
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### 4. Copy Your Public Key
```bash
cat ~/.ssh/id_ed25519.pub
```
- Copy the output to your clipboard

### 5. Add Your Key to GitHub
- Go to: [https://github.com/settings/keys](https://github.com/settings/keys)
- Click **New SSH Key**
- Title: something like `EliteBook`
- Paste the key into the box and save

### 6. Change Git Remote to Use SSH
```bash
git remote set-url origin git@github.com:waterloo8675309/dotfiles.git
```

### 7. Push Your Work
```bash
git push -u origin main
```
- You may be prompted to allow the SSH key or enter the passphrase

### 8. Verify It Works
```bash
ssh -T git@github.com
```
Expected output:
```
Hi waterloo8675309! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## Automated Bootstrap Instructions

### 1. Restore From Git
If this repository hasn’t been cloned yet, run:
```bash
git clone git@github.com:waterloo8675309/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run the Restore Script
```bash
bash restore.sh
```
This script will:
- Symlink your dotfiles
- Add ~/.local/bin to your PATH if missing
- Set Zsh as the default shell
- Run your bootstrap.sh to finalize setup

### 3. Install System Packages (Linux Mint / Ubuntu Base)
```bash
sudo apt update && sudo apt install -y \
  git curl zsh build-essential \
  meson ninja-build \
  libpam0g-dev libcairo2-dev libev-dev \
  libx11-dev libxcb1-dev libxcb-xkb-dev \
  libxcb-image0-dev libxcb-util0-dev libxcb-composite0-dev \
  libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev \
  libpam-wrapper libwayland-dev wayland-protocols \
  libdrm-dev libgbm-dev libpixman-1-dev libsystemd-dev \
  pkg-config scdoc
```

### 4. Optional: Build `swaylock-effects`
```bash
git clone https://github.com/mortie/swaylock-effects.git
cd swaylock-effects
meson setup build
ninja -C build
sudo ninja -C build install
```

Then update your sway lockscreen script to use it with your preferred effects:
```bash
swaylock \
  --screenshots \
  --clock \
  --indicator \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --ring-color 2d3748 \
  --key-hl-color b4f9f8 \
  --line-color 00000000 \
  --inside-color 00000088 \
  --separator-color 00000000 \
  --grace 2 \
  --fade-in 0.2
```

You're now fully equipped to rehydrate your full setup on any compatible system.

#!/bin/bash

REPO_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

link_config() {
  local src="$1"
  local dest="$2"
  echo "Linking $src → $dest"
  mkdir -p "$(dirname "$dest")"
  ln -sf "$src" "$dest"
}

# Core configs
link_config "$REPO_DIR/.zshrc" "$HOME/.zshrc"
link_config "$REPO_DIR/starship.toml" "$CONFIG_DIR/starship.toml"

# WM and UI configs
link_config "$REPO_DIR/config/sway" "$CONFIG_DIR/sway"
link_config "$REPO_DIR/config/waybar" "$CONFIG_DIR/waybar"

# Execute bootstrap
bash "$REPO_DIR/bootstrap.sh"
