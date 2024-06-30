return {
	"stevearc/conform.nvim",
	event = "bufwritepre",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- markdown= {'mdformat'},				-- conform will run multiple formatters sequentially
				python = { { "isort", "black" } },
				nix= { 'alejandra' },
				-- use a sub-list to run only the first available formatter
				javascript = { { "prettierd" } },
			},
		})
	end,
}
