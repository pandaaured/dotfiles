return {
  "theHamsta/nvim-dap-virtual-text",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    enabled = true,                        -- Enable this plugin (the default)
    enabled_commands = true,               -- Create commands DapVirtualTextEnable, DapVirtualTextDisable, etc.
    highlight_changed_variables = true,    -- Highlight changed values with NvimDapVirtualTextChanged, else regular values
    highlight_new_as_changed = false,      -- Highlight new variables in the same way as changed variables
    show_stop_reason = true,               -- Show stop reason when stopped on a breakpoint
    commented = false,                     -- Prefix virtual text with comment string
    only_manually_attached = false,        -- Only activate virtual text when a cursor is attached manually
    virt_text_pos = 'eol',                 -- Position of virtual text: 'eol', 'overlay', 'inline' or 'right_align'
    all_references = false,                -- Show virtual text on all all references of the variable (not just definitions)
    clear_on_continue = false,             -- Clear virtual text on "continue" (might cause flickering)
    -- A callback function to determine if a variable should be displayed
    display_callback = function(variable, buf, stackframe, node, options)
      if options.virt_text_pos == 'inline' then
        return ' = ' .. variable.value
      else
        return variable.name .. ' = ' .. variable.value
      end
    end,
    -- Position of virtual text: 'inline' requires Neovim >= 0.10
    virt_text_win_col = nil                -- Position the virtual text at a fixed column
  },
}

