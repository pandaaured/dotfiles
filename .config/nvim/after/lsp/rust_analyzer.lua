return {
  on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(bufnr, true)
    end
  end
}
