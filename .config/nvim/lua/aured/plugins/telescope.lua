return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "files" },
    { "<leader>fs", "<cmd>Telescope live_grep<CR>",   desc = "string in cwd" },
    { "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "string under cursor" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>",    desc = "recent files" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "help tags" },
    { "<leader>fr", "<cmd>Telescope resume<CR>",      desc = "resume last" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "filename_first" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        preview = {
          treesitter = false,
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = { "^%.git/" },
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
