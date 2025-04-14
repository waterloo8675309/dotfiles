local wezterm = require 'wezterm'

return {
  default_prog = { '/usr/bin/zsh' },

  color_scheme = 'CustomCyberpunk',

  font = wezterm.font_with_fallback {
    'JetBrainsMono Nerd Font',
    'FiraCode Nerd Font',
  },
  font_size = 11.5,

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = true,

  window_padding = {
    left = 10,
    right = 10,
    top = 6,
    bottom = 6,
  },

  window_background_opacity = 0.92,

  color_schemes = {
    ['CustomCyberpunk'] = {
      foreground = '#e0e0ff',
      background = '#0d0f18',
      cursor_bg = '#ff6ac1',
      cursor_border = '#ff6ac1',
      cursor_fg = '#0d0f18',
      selection_bg = '#3c1361',
      selection_fg = '#ffffff',

      ansi = {
        '#1b1d2b', '#ff6ac1', '#66ff66', '#ffff66',
        '#66ccff', '#c792ea', '#7afde2', '#ffffff',
      },

      brights = {
        '#3b3f51', '#ff99cc', '#aaffaa', '#ffff99',
        '#99ccff', '#e1acff', '#a1efe4', '#ffffff',
      },

      tab_bar = {
        background = '#1b1d2b',
        active_tab = {
          bg_color = '#52307c',
          fg_color = '#ffffff',
          intensity = 'Bold',
        },
        inactive_tab = {
          bg_color = '#1b1d2b',
          fg_color = '#999999',
        },
        inactive_tab_hover = {
          bg_color = '#3c1361',
          fg_color = '#ffffff',
        },
      },
    },
  },
}
