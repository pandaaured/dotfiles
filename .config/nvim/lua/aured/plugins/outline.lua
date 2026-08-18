return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>ss", "<cmd>Outline<CR>", desc = "toggle outline" },
  },
  opts = {
    outline_window = {
      position = "right",
    },
  },
}
