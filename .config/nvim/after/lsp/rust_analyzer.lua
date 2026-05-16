return {
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.schedule(function()
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end)
    end
  end,
  settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        bindingModeHints = { enable = true },
        chainingHints = { enable = true },
        closingBraceHints = { enable = true },
        parameterHints = { enable = true },
        typeHints = { enable = true },
      },
    },
  },
}
