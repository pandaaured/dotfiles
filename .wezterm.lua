-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Auto-detect system appearance
local function scheme_for_appearance()
  if wezterm.gui.get_appearance():find('Dark') then
    return 'Ayu Dark (Gogh)'
  else
    return 'Ayu Light (Gogh)'
  end
end

config.color_scheme = scheme_for_appearance()  -- replaces your static line

-- Live-switch when macOS toggles dark/light mode
wezterm.on('window-config-reloaded', function(window)
  local overrides = window:get_config_overrides() or {}
  overrides.color_scheme = scheme_for_appearance()
  window:set_config_overrides(overrides)
end)

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
config.font = wezterm.font('Iosevka Nerd Font Propo')
config.font_size = 16

config.default_cursor_style = 'BlinkingBar'

config.hide_tab_bar_if_only_one_tab = true
-- Finally, return the configuration to wezterm:
return config
