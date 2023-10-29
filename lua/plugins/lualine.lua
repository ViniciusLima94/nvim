return{
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',
	-- See `:help lualine.txt`
	dependencies = {'nvim-tree/nvim-web-devicons'},
	opts = {
		options = {
			icons_enabled = true,
			theme = "nightfly",
			component_separators = '|',
			section_separators = '',
		},
	},
	-- config=function()
	-- 	local lualine=require 'lualine'
	-- 	require 'lazy.status'
	-- 	lualine.setup({})
	-- end,

}
