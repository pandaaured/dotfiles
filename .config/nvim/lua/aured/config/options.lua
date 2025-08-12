vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- tabs are spaces
opt.autoindent = true -- copies indent from current line when starting new

-- search settings
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- if search has mixed case, assume we want case-sens

opt.cursorline = true

-- turn on termgui colors for more colors, needs true color terminal
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
