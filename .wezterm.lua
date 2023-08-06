-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
-- Use config_builder for clearer error messages.
local config = wezterm.config_builder()

config.colors = {
  foreground = '#f1f1f1'
}
config.font = wezterm.font_with_fallback { 'JetBrains Mono', 'Apple Color Emoji' }
config.font_size = 14.0
config.initial_rows = 35
config.initial_cols = 90
config.enable_scroll_bar = true
config.keys = {
  {
    key = 'Backspace',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'u',
      mods = 'CTRL'
    },
  },
  {
    key = 'Backspace',
    mods = 'OPT',
    action = wezterm.action.SendKey {
      key = 'Backspace',
      mods = 'CTRL'
    },
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'LeftArrow',
      mods = 'SHIFT'
    },
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey {
      key = 'RightArrow',
      mods = 'SHIFT'
    },
  },
}

return config
