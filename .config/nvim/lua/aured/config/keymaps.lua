vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local keymap = vim.keymap

-- Core editor bindings. 
-- <leader>e* are bindings corresponding to nvim-tree.lua
-- <leader>d* are bindings corresponding to trouble.lua
-- <leader>ss is a binding corresponding to outline
-- <leader>f* are bindings corresponding to telescope.lua
-- <leader>gg are bindings corresponding to lazygit.lua
-- <leader>g* are bindings corresponding to gitsigns.lua
    -- these are buffer local on attach.
-- <leader>c/l/r/s*, g* are bindings corresponding to lsp.lua.
    -- these are buffer local on attach.

---- MISC --------------------------------------------------------------------
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

---- [WINDOW] ----------------------------------------------------------------
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>sm", "<C-w>_<C-w>|", { desc = "Maximize split" })
keymap.set("n", "<leader>sn", "<C-w>n", { desc = "New empty split" })
keymap.set("n", "<leader>so", "<C-w>o", { desc = "Close all other splits" })
keymap.set("n", "<leader>sr", "<C-w>r", { desc = "Rotate splits" })
keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Swap with next split" })
keymap.set("n", "<leader>st", "<C-w>t", { desc = "Move split to new tab" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
keymap.set("n", "<leader>s`", "<cmd>terminal<CR>", { desc = "Open terminal" })

keymap.set("n", "<leader>w+", "<cmd>resize +5<CR>", { desc = "Increase height" })
keymap.set("n", "<leader>w-", "<cmd>resize -5<CR>", { desc = "Decrease height" })
keymap.set("n", "<leader>w>", "<cmd>vertical resize +5<CR>", { desc = "Increase width" })
keymap.set("n", "<leader>w<", "<cmd>vertical resize -5<CR>", { desc = "Decrease width" })

keymap.set("n", "<A-h>", "<C-w>h", { desc = "Window left" })
keymap.set("n", "<A-j>", "<C-w>j", { desc = "Window down" })
keymap.set("n", "<A-k>", "<C-w>k", { desc = "Window up" })
keymap.set("n", "<A-l>", "<C-w>l", { desc = "Window right" })

---- [TERMINAL] --------------------------------------------------------------
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h", { desc = "Window left" })
keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j", { desc = "Window down" })
keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k", { desc = "Window up" })
keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l", { desc = "Window right" })

---- [TABS] ------------------------------------------------------------------
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Buffer in new tab" })

