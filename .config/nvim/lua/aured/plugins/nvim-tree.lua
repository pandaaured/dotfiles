return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  lazy = false,
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "toggle" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "reveal current file" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "collapse" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "refresh" },
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
