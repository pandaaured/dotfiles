vim.opt.exrc = true
vim.opt.secure = true

vim.lsp.enable({
  "clangd",
  "cssls",
  "html",
  "lua_ls",
  "millet",
  "pyright",
  "rust_analyzer",
  "svelte",
  "texlab",
  "tinymist",
  "ts_ls",
})

-- Inlay hint state is global.
vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  jump = {
    on_jump = function(diagnostic, bufnr)
      if not diagnostic then
        return
      end
      vim.diagnostic.open_float({ bufnr = bufnr, scope = "cursor", focus = false })
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

local function map(mode, lhs, rhs, desc, opts)
  opts = vim.tbl_extend("force", { silent = true, desc = desc }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function lsp_restart()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if vim.tbl_isempty(clients) then
    vim.notify("no LSP client attached to this buffer", vim.log.levels.WARN)
  end
  for _, client in ipairs(clients) do
    client:stop(true)
  end
  vim.schedule(function() vim.cmd.edit() end)
end

---- [LSP] --------------------------------------------------------------------

map("n", "<leader>lr", lsp_restart, "restart clients")
map("n", "<leader>li", "<cmd>checkhealth vim.lsp<CR>", "client info")
map("n", "<leader>lh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, "toggle inlay hints")

---- [DIAGNOSTICS] ------------------------------------------------------------

map("n", "<leader>dd", vim.diagnostic.open_float, "line float")

---- [BUFFER-LOCAL] ------------------------------------------------------------

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local buf = { buffer = ev.buf }

    ---- [CODE] ----------------------------------------------------------------
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "action", buf)
    map({ "n", "v" }, "<leader>cf", function()
      vim.lsp.buf.format({ async = true })
    end, "format", buf)
    if client and client:supports_method("textDocument/codeLens") then
      map({ "n", "v" }, "<leader>cl", vim.lsp.codelens.run, "run codelens", buf)
      -- enable() subsumes the old refresh-on-BufEnter/InsertLeave autocmd;
      -- codelens.refresh() is deprecated as of 0.12, removal in 0.13.
      vim.lsp.codelens.enable(true, { bufnr = ev.buf })
    end

    ---- [REFACTOR] ------------------------------------------------------------
    map("n", "<leader>rn", vim.lsp.buf.rename, "rename", buf)

    ---- [SYMBOLS] -------------------------------------------------------------
    map("n", "<leader>sd",
      "<cmd>Telescope lsp_document_symbols<CR>", "document", buf)
    map("n", "<leader>sw",
      "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "workspace", buf)
    map("n", "<leader>si",
      "<cmd>Telescope lsp_incoming_calls<CR>", "incoming calls", buf)
    map("n", "<leader>so",
      "<cmd>Telescope lsp_outgoing_calls<CR>", "outgoing calls", buf)

    ---- [TYPES] ---------------------------------------------------------------
    map("n", "<leader>st", function()
      vim.lsp.buf.typehierarchy("supertypes")
    end, "supertypes", buf)
    map("n", "<leader>sb", function()
      vim.lsp.buf.typehierarchy("subtypes")
    end, "subtypes", buf)

    ---- [GOTO] ---------------------------------------------------------------
    map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "definitions", buf)
    map("n", "gi",
      "<cmd>Telescope lsp_implementations<CR>", "implementations", buf)
    map("n", "gt",
      "<cmd>Telescope lsp_type_definitions<CR>", "type definitions", buf)
    map("n", "gR", "<cmd>Telescope lsp_references<CR>", "references", buf)

    ---- [INFO] ---------------------------------------------------------------
    map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "signature", buf)
  end,
})
