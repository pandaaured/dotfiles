return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "general" -- Setting for PDF viewer (to be opened upon :VimtexCompile)
  end
}
