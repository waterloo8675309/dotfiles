export PATH="$HOME/swaylock-effects/build:$PATH"
# Created by newuser for 5.8.1
# ~/.zshrc

# Launch Starship prompt
eval "$(starship init zsh)"

if [ -e /home/greg/.nix-profile/etc/profile.d/nix.sh ]; then . /home/greg/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias hypr-dev='cd ~/Hyprland && nix develop'
