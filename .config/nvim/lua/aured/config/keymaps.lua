vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local keymap = vim.keymap -- concisenes

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" }) 

-- increment/decrement numbers

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Splitwindow vertically" }) -- split window horizontal
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Splitwindow horizontally" }) -- split window vertical
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Splits equal size" }) -- split window equal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- split window close

-- tab management


keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabnp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- 


-- Telescope management 
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" }) 
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" }) 

