-- mapleader linked to space
vim.g.mapleader = ' '
--write code here
vim.g.maplocalleader = ' '
vim.o.clipboard='unnamedplus'
vim.cmd('set relativenumber')
vim.o.termguicolors = true
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Flashes the Yanked highlighted part
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
