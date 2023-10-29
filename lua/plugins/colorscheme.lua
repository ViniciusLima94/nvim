return{ "bluz71/vim-nightfly-colors",
name = "nightfly",
lazy = false,
priority = 1000,
config= function()
	vim.cmd.colorscheme 'nightfly'
end,}

-- return {'stevedylandev/flexoki-nvim',
-- name = 'flexoki',
-- lazy=false,
-- priority=1000,
-- config=function()
-- -- Set colorscheme after options
-- vim.cmd('colorscheme flexoki')
-- end,
--
-- }
