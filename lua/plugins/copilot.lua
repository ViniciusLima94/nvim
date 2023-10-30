return{
		"zbirenbaum/copilot.lua",
		dependencies={"zbirenbaum/copilot-cmp"},
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	}
