return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    require('ayu').setup {
      mirage = false,
      terminal = true,
      overrides = {},
    }

    -- Detect system appearance
    local function is_dark_mode()
      if vim.fn.has('mac') == 1 then
        local out = vim.fn.system('defaults read -g AppleInterfaceStyle 2>/dev/null')
        return vim.trim(out) == 'Dark'
      elseif vim.fn.has('unix') == 1 then
        local out = vim.fn.system('gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null')
        return out:find('dark') ~= nil
      end
      return false -- fallback to light
    end

    if is_dark_mode() then
      vim.cmd('colorscheme ayu-dark')
    else
      vim.cmd('colorscheme ayu-light')
    end
  end
}
