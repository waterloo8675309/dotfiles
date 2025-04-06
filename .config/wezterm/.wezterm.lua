-- DOTFILES PACKAGE: wezterm + starship + zebar + powerline aesthetic
-- Directory structure:
-- ~/.config/wezterm/.wezterm.lua
-- ~/.config/starship.toml
-- ~/.glzr/zebar/ (contains vanilla-clear style)

-- wezterm config:
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11.0
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
  left = 10,
  right = 10,
  top = 5,
  bottom = 5,
}

-- Fancy title bar styling
config.window_frame = {
  font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
  font_size = 11.0,
  active_titlebar_bg = "#1E1E2E",
  inactive_titlebar_bg = "#1E1E2E",
}

-- Default shell
config.default_prog = { "C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe", "-NoLogo" }

-- Start WezTerm in home directory
config.default_cwd = wezterm.home_dir

-- Shell launcher menu
config.launch_menu = {
  { label = "PowerShell 7 Preview", args = { "C:\\Program Files\\PowerShell\\7-preview\\pwsh.exe", "-NoLogo" } },
  { label = "Windows PowerShell",   args = { "powershell.exe", "-NoLogo" } },
  { label = "Command Prompt",       args = { "cmd.exe" } },
  { label = "WSL (Ubuntu)",         args = { "wsl.exe" } },
}

-- Keybindings for pane splits and navigation
config.keys = {
  { key = "Enter", mods = "ALT", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "\\",    mods = "ALT", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
  { key = "LeftArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection "Right" },
  { key = "UpArrow",    mods = "ALT", action = wezterm.action.ActivatePaneDirection "Up" },
  { key = "DownArrow",  mods = "ALT", action = wezterm.action.ActivatePaneDirection "Down" },
}

-- Starship greeting message in PowerShell profile
-- File: $PROFILE (for PowerShell 7)
-- Add this:
-- Write-Host "`n   💫 Welcome back, Greg — stay soft and dangerous 💫`n" -ForegroundColor Magenta
-- Invoke-Expression (&starship init powershell)

-- Starship config file: ~/.config/starship.toml
-- Paste this there:
--
-- format = """
--[┌](bold fg:#f5c2e7)$time$directory$git_branch$git_status$nodejs$python$rust$battery
--[└](bold fg:#f5c2e7) $character
--"""
-- add_newline = false
--
-- [character]
-- success_symbol = "[➜](bold fg:#cba6f7)"
-- error_symbol = "[✗](bold fg:#f38ba8)"
--
-- [directory]
-- style = "bold fg:#89b4fa"
-- truncation_length = 3
-- truncation_symbol = "…/"
-- read_only = " "
--
-- [git_branch]
-- symbol = "🌱 "
-- style = "fg:#fab387"
--
-- [git_status]
-- style = "fg:#f9e2af"
-- conflicted = "⚔️ "
-- ahead = "⇡${count}"
-- behind = "⇣${count}"
-- diverged = "⇕⇡${ahead_count}⇣${behind_count}"
-- untracked = "✚${count}"
-- stashed = "📦"
-- modified = "📝"
-- staged = "✅"
-- deleted = "🗑️"
-- renamed = "➡️"
--
-- [nodejs]
-- symbol = " "
-- style = "fg:#a6e3a1"
--
-- [python]
-- symbol = " "
-- style = "fg:#f38ba8"
--
-- [rust]
-- symbol = "🦀 "
-- style = "fg:#fab387"
--
-- [cmd_duration]
-- min_time = 200
-- style = "italic fg:#94e2d5"
-- format = "⏱ [$duration]($style)"
--
-- [battery]
-- full_symbol = "🔋"
-- charging_symbol = "⚡"
-- discharging_symbol = "🔌"
-- disabled = false
-- format = " [$symbol $percentage]($style)"
--
-- [time]
-- disabled = false
-- time_format = "%H:%M"
-- format = "🕒 [$time]($style) "
-- style = "fg:#b4befe"

-- Zebar directory: ~/.glzr/zebar
-- Use the 'vanilla-clear' widget copied from make-windows-pretty
-- Customize style.css to match Catppuccin Mocha
-- Add Zebar to Windows Startup or launch manually via:
-- Start-Process "C:\\Program Files\\glzr.io\\Zebar\\zebar.exe"

return config
