return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  cmd = "Trouble",
  opts = {
    focus = true,
  },
  keys = {
    { "<leader>db", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "buffer" },
    { "<leader>dw", "<cmd>Trouble diagnostics toggle<CR>", desc = "workspace" },
    { "<leader>dq", "<cmd>Trouble quickfix toggle<CR>", desc = "quickfix list" },
    { "<leader>dl", "<cmd>Trouble loclist toggle<CR>", desc = "location list" },
    { "<leader>dt", "<cmd>Trouble todo toggle<CR>", desc = "todos" },
  },
}
