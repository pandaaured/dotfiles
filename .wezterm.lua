-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.keys = {
  -- Move back 1 word 
  { key = 'LeftArrow', mods = 'OPT', action=wezterm.action.SendKey { mods = 'ALT', key = 'b' } },
  -- Move forward 1 word
  { key = 'RightArrow', mods = 'OPT', action=wezterm.action.SendKey { mods = 'ALT', key = 'f' } },
  -- Move to start of line
  { key = 'LeftArrow', mods = 'CMD', action=wezterm.action.SendKey { mods = 'CTRL', key = 'a' } },
  -- Move to end of line
  { key = 'RightArrow', mods = 'CMD', action=wezterm.action.SendKey { mods = 'CTRL', key = 'e' } },
  -- Delete whole line
  { key = 'Backspace', mods = 'CMD', action=wezterm.action.SendKey { mods = 'CTRL', key = 'u' } },
}


-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
-- config.font = wezterm.font('Iosevka Nerd Font Propo')
config.font_size = 16

config.default_cursor_style = 'BlinkingBar'

config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  foreground = "#93a4c3",
  background = "#1a212e",
  cursor_bg = "#54b0fd",
  cursor_border = "#54b0fd",
  cursor_fg = "#1a212e",
  selection_fg = "#93a4c3",
  selection_bg = "#283347",
  ansi = { "#0c0e15", "#f65866", "#8bcd5b", "#efbd5d", "#41a7fc", "#c75ae8", "#34bfd0", "#93a4c3" },
  brights = { "#455574", "#ff6b78", "#8bcd5b", "#ffcf72", "#63bcff", "#dd7bf5", "#4fd8ea", "#b8c6e0" },
}

config.front_end = "OpenGL"
-- Finally, return the configuration to wezterm:
return config
