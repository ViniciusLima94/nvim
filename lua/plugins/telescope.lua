return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Fuzzy Finder Algorithm which requires local dependencies to be built.
		-- Only load if `make` is available. Make sure you have the system
		-- requirements installed.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- NOTE: If you are having trouble with this installation,
			--       refer to the README for telescope-fzf-native for more instructions.
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
					},
				},
			},
		})
		-- Custom picker for dotfiles
		local find_dotfiles = function()
			require("telescope.builtin").find_files({
				find_command = { "fd", "--type", "f", "--hidden", "--glob", ".*" },
			})
		end

		-- Create a custom command for dotfiles
		vim.api.nvim_create_user_command("TelescopeDotfiles", find_dotfiles, {})
		-- Enable telescope fzf native, if installed
		telescope.load_extension("fzf")
		-- telescope.load_extension("noice")
	end,
}
