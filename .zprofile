# Automatically run restore script once per system setup
RESTORED_FLAG="$HOME/.restore_completed"

if [ -f "$HOME/dotfiles/restore.sh" ] && [ ! -f "$RESTORED_FLAG" ]; then
  echo "🔁 First-time restore.sh triggered..."
  bash "$HOME/dotfiles/restore.sh"
  touch "$RESTORED_FLAG"
fi
