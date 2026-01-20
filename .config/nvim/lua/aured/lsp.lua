vim.lsp.enable("lua_ls");
vim.lsp.enable("ts_ls");
vim.lsp.enable("rust_analyzer");
vim.lsp.enable("cssls");
vim.lsp.enable("html");
vim.lsp.enable("texlab");
vim.lsp.enable("pyright");
vim.lsp.enable("clangd");
vim.lsp.enable("millet");

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)

    vim.lsp.inlay_hint.enable(true)
    local opts = { buffer = ev.buf, silent = true }

    opts.desc = "Show LSP references."
    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_reference<CR>", opts)

    opts.desc = "Go to declaration."
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definition."
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementations."
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementation<CR>", opts)

    opts.desc = "Show LSP type definitions"
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "See available code actions"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) 

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d",
      function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

    opts.desc = "Toggle LSP Inlay Hints"
    vim.keymap.set("n", "gh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) 
      end, 
    opts)

  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})
