return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.10.0",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
}
