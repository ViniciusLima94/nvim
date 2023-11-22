-- mapleader linked to space
vim.g.mapleader = " " -- Set <Leader> to the Space key
--write code here
vim.g.maplocalleader = " "
-- vim.g.python3_host_prog = '/usr/local/bin/python'
vim.opt.clipboard = "unnamedplus"
vim.cmd("set relativenumber")
vim.opt.termguicolors = true
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Flashes the Yanked highlighted part
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
-- Set the width of tabs and spaces
vim.cmd("set shiftwidth=2") -- Number of spaces per tab
vim.cmd("set tabstop=2") -- Number of spaces that a <Tab> in the file counts for
