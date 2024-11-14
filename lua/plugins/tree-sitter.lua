return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"nix",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"luap",
				-- "latex",
				"regex",
				"markdown",
				"markdown_inline",
				"python",
				"toml",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
					goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
					goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
				},
			},
		})
		vim.o.foldmethod = "expr"
		vim.o.foldexpr = "nvim_treesitter#foldexpr()"
		vim.o.foldenable = false
	end,
}
