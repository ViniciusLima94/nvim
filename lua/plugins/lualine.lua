return {
	-- Set lualine as statusline
	"nvim-lualine/lualine.nvim",
	-- See `:help lualine.txt`
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lazy.status")
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch" },
					{
						"diff",
						colored = true,
						diff_color = {
							added = "LuaLineDiffAdd", -- Changes the diff's added color
							modified = "LuaLineDiffChange", -- Changes the diff's modified color
							removed = "LuaLineDiffDelete",
							-- Same color values as the general color option can be used here.
							-- added =  '#00FF00', -- Changes the diff's added color
							-- modified = '#FFFF00', -- Changes the diff's modified color
							-- removed = "#ff0000", -- Changes the diff's removed color you
						},
						symbols = { added = " ", modified = "柳", removed = " " },
					},
					{ "diagnostics" },
				},
				lualine_c = {
					"filename",
				},
				lualine_x = {
					{ "encoding" },
					{ "fileformat", symbols = { unix = "", dos = "", mac = "" } },
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
		-- Define custom highlight groups for diff added, modified, and removed
		vim.api.nvim_command("highlight LuaLineDiffAdd guifg=#00FF00")
		vim.api.nvim_command("highlight LuaLineDiffChange guifg=#FFFF00")
		vim.api.nvim_command("highlight LuaLineDiffDelete guifg=#ff0000")
	end,
}
