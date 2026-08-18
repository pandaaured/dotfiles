return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "toggle" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "reveal current file" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "collapse" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "refresh" },
    { "<leader>eo", "<cmd>NvimTreeFocus<CR>", desc = "focus" },
    {
      "<leader>eE", function()
        require("nvim-tree.api").tree.expand_all()
      end,
      desc = "expand all"
    },
    {
      "<leader>eh", function()
        require("nvim-tree.api").filter.dotfiles.toggle()
      end,
      desc = "toggle dotfiles"
    },
    {
      "<leader>eg", function()
        require("nvim-tree.api").filter.git_ignored.toggle()
      end,
      desc = "toggle git-ignored"
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- disable window_picker so opening files cooperates with splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })
  end,
}

