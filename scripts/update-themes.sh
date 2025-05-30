#!/usr/bin/env bash
set -euo pipefail

# 1) Make sure script folder exists
dir=
# Create scripts dir if missing
mkdir -p "$HOME/.config/scripts"

# 2) Ensure theme dirs exist (skip existing symlinks or dirs)
for d in "$HOME/.config/polybar" "$HOME/.config/rofi" "$HOME/.config/wezterm"; do
  if [ ! -d "$d" ] && [ ! -L "$d" ]; then
    mkdir -p "$d"
  fi
done

# 3) Load palette
source "$HOME/.config/colors.conf"

# 4) Generate Polybar theme
echo "[colors]" > "$HOME/.config/polybar/colors.ini"
echo "background = $BG_DARK" >> "$HOME/.config/polybar/colors.ini"
echo "foreground = $FG_LIGHT" >> "$HOME/.config/polybar/colors.ini"
echo "primary    = $ACCENT_DEEP" >> "$HOME/.config/polybar/colors.ini"
echo "secondary  = $CYAN_BRIGHT" >> "$HOME/.config/polybar/colors.ini"
echo "alert      = $YELLOW_GLOW" >> "$HOME/.config/polybar/colors.ini"
echo "highlight  = $HIGHLIGHT_NEON" >> "$HOME/.config/polybar/colors.ini"

# 5) Generate Rofi theme
cat > "$HOME/.config/rofi/cyberpunk.rasi" << 'EOF'
window {
  background: $BG_DARK;
  color:      $FG_LIGHT;
}
element selected {
  background:   $HIGHLIGHT_NEON;
  border-color: $ACCENT_DEEP;
}
element active {
  background: $CYAN_BRIGHT;
  color:      $BG_DARK;
}
EOF

# 6) Generate WezTerm theme
cat > "$HOME/.config/wezterm/colors.lua" << 'EOF'
return {
  foreground = "$FG_LIGHT",
  background = "$BG_DARK",

  cursor_bg = "$HIGHLIGHT_NEON",
  cursor_border = "$HIGHLIGHT_NEON",
  cursor_fg = "$BG_DARK",

  selection_bg = "$TEAL_LEAF",
  selection_fg = "$BG_DARK",

  ansi = {"#000000", "$HIGHLIGHT_NEON", "$TEAL_LEAF", "$YELLOW_GLOW", "$CYAN_BRIGHT", "$ACCENT_DEEP", "$FROST_LIGHT", "$FG_LIGHT"},
  brights = {"$FOG_MID", "#FF77FF", "#77FFD6", "#FFFFAA", "#AAFFFF", "#C266FF", "#AAFFF7", "#FFFFFF"},
}
EOF

# 7) Make executable
chmod +x "$HOME/.config/scripts/update-themes.sh"
echo "Themes updated successfully...Bitch!"
