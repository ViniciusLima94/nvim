-- return{ "bluz71/vim-nightfly-colors",
-- name = "nightfly",
-- lazy = false,
-- priority = 1000,
-- config= function()
-- 	vim.cmd.colorscheme 'nightfly'
-- end,}
return {

	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			style = "moon",
			-- transparent= true,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
