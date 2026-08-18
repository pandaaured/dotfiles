return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>c", group = "code" },
      { "<leader>d", group = "diagnostics" },
      { "<leader>e", group = "explorer" },
      { "<leader>f", group = "find" },
      { "<leader>l", group = "lsp" },
      { "<leader>r", group = "refactor" },
      { "<leader>s", group = "symbols" },
      { "<leader>t", group = "types" },
    },
  },
}
