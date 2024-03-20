return {
	"nvim-neorg/neorg",
	dependencies = { "nvim-lua/plenary.nvim" },
	build = ":Neorg sync-parsers",
	-- tag = "*",
	lazy = true, -- enable lazy load
	ft = "norg", -- lazy load on file type
	cmd = "Neorg", -- lazy load on command
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "/Users/hamzahalloway/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten/Fleeting Notes/",
							literature = "/Users/hamzahalloway/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten/Literature Notes",
							permanent = "/Users/hamzahalloway/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten/Permanent Notes",
						},
						default_workspace="notes"
					},
				},
			},
		})
	end,
}
