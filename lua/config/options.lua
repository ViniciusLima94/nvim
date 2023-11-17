-- mapleader linked to space
vim.g.mapleader = " " -- Set <Leader> to the Space key
--write code here
vim.g.maplocalleader = " "
-- vim.g.python3_host_prog = '/usr/local/bin/python'
vim.o.clipboard = "unnamedplus"
vim.cmd("set relativenumber")
vim.o.termguicolors = true
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
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
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = false
-- Send the block of code to the terminal
vim.api.nvim_set_keymap("n", "<leader>sa", [[:call jukit#send#section(0)<CR>]], { noremap = true, silent = true })
--Send the line of code to the terminal
vim.api.nvim_set_keymap("n", "<leader>sl", [[:call jukit#send#line()<CR>]], { noremap = true, silent = true })
-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"
-- Set the width of tabs and spaces
vim.cmd("set shiftwidth=2") -- Number of spaces per tab
vim.cmd("set tabstop=2") -- Number of spaces that a <Tab> in the file counts for
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "ueberzug"
