vim.opt.exrc = true
vim.opt.secure = true

vim.lsp.enable("lua_ls");
vim.lsp.enable("ts_ls");
vim.lsp.enable("rust_analyzer");
vim.lsp.enable("cssls");
vim.lsp.enable("html");
vim.lsp.enable("texlab");
vim.lsp.enable("pyright");
vim.lsp.enable("clangd");
vim.lsp.enable("millet");
vim.lsp.enable("svelte");
vim.lsp.enable("tinymist");

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)

    -- [lsp] inlay hints are enabled by default.
    vim.lsp.inlay_hint.enable(true)
    local opts = { buffer = ev.buf, silent = true }

    ---- [edit] ---------------------------------------------------------------

    opts.desc = "[edit] code action"
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "[edit] rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    ---- [find] ---------------------------------------------------------------

    opts.desc = "[find] buffer diagnostics"
    vim.keymap.set("n", "<leader>D",
      "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "[find] document symbols"
    vim.keymap.set("n", "<leader>ds",
      "<cmd>Telescope lsp_document_symbols<CR>", opts)

    opts.desc = "[find] incoming calls"
    vim.keymap.set("n", "<leader>ci", vim.lsp.buf.incoming_calls, opts)

    opts.desc = "[find] workspace symbols"
    vim.keymap.set("n", "<leader>ws",
      "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", opts)

    opts.desc = "[find] references"
    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    ---- [goto] ---------------------------------------------------------------

    opts.desc = "[goto] declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "[goto] definition"
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    opts.desc = "[goto] implementations"
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementation<CR>", opts)

    opts.desc = "[goto] supertypes"
    vim.keymap.set("n", "<leader>th",
      function() vim.lsp.buf.typehierarchy("supertypes") end, opts)

    opts.desc = "[goto] type definitions"
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    ---- [info] ---------------------------------------------------------------

    opts.desc = "[info] line diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "[info] signature help"
    vim.keymap.set({"n", "i"}, "<C-k>", vim.lsp.buf.signature_help, opts)

    ---- [lsp] ----------------------------------------------------------------

    opts.desc = "[lsp] restart"
    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

    opts.desc = "[lsp] toggle inlay hints"
    vim.keymap.set("n", "gh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, opts)

    ---- [nav] ----------------------------------------------------------------

    opts.desc = "[nav] prev diagnostic"
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)

    opts.desc = "[nav] next diagnostic"
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

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
