return {
	"zbirenbaum/copilot.lua",
	dependencies = "zbirenbaum/copilot-cmp",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot_cmp").setup()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				python = true,
				javascript = true,
				lua = true,
			}

		})
	end,
}
