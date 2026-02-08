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
config.font_size = 13

-- Finally, return the configuration to wezterm:
return config
