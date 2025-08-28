return {
  "stevearc/conform.nvim",
  tag = "stable",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    { "<leader>bb", function()
      require("conform").format({ async = true}) end,
      mode = "", desc = "Format buffer", },
  },
  --@module "conform"
  --@type conform.setupOpts
}
