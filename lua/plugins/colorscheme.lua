-- return{ "bluz71/vim-nightfly-colors",
-- name = "nightfly",
-- lazy = false,
-- priority = 1000,
-- config= function()
-- 	vim.cmd.colorscheme 'nightfly'
-- end,}
-- return {
--
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			-- your configuration comes here
-- 			-- or leave it empty to use the default settings
-- 			style = "moon",
-- 			-- transparent= true,
-- 		})
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }

return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({})
		vim.cmd.colorscheme("solarized-osaka")
	end,
}
