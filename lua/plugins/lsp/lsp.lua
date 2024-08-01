return {
	-- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",

		"WhoIsSethDaniel/mason-tool-installer.nvim",

		"williamboman/mason-lspconfig.nvim",
		-- Adds LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",

		-- Useful status updates for LSP
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", tag = "legacy", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					{ plugins = { "nvim-dap-ui" }, types = true },
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		-- [[ Configure LSP ]]
		require("lazy").setup()
		--  This function gets run when an LSP connects to a particular buffer.
		local on_attach = function(_, bufnr)
			-- NOTE: Remember that lua is a real programming language, and as such it is possible
			-- to define small helper and utility functions so you don't have to repeat yourself
			-- many times.
			--
			-- In this case, we create a function that lets us more easily define mappings specific
			-- for LSP related items. It sets the mode, buffer and description for us each time.
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end
			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
			nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- See `:help K` for why this keymap
			nmap("I", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-i>", vim.lsp.buf.signature_help, "Signature Documentation")
			-- Create a command `:Format` local to the LSP buffer
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_fallback = true, range = range })
			end, { range = true })
		end
		-- mason-lspconfig requires that these setup functions are called in this order
		-- before setting up the servers.
		require("mason").setup()
		require("mason-tool-installer").setup({

			ensure_installed = {

				"black",
				"debugpy",
				"stylua",
				"luacheck",
				"shellcheck",
			},

			-- if set to true this will check each tool for updates. If updates
			-- are available the tool will be updated. This setting does not
			-- affect :MasonToolsUpdate or :MasonToolsInstall.
			-- Default: false
			auto_update = false,

			-- automatically install / update on startup. If set to false nothing
			-- will happen on startup. You can use :MasonToolsInstall or
			-- :MasonToolsUpdate to install tools and check for updates.
			-- Default: true
			run_on_start = true,

			-- set a delay (in ms) before the installation starts. This is only
			-- effective if run_on_start is set to true.
			-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
			-- Default: 0
			start_delay = 3000, -- 3 second delay

			-- Only attempt to install if 'debounce_hours' number of hours has
			-- elapsed since the last time Neovim was started. This stores a
			-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
			-- This is only relevant when you are using 'run_on_start'. It has no
			-- effect when running manually via ':MasonToolsInstall' etc....
			-- Default: nil
			debounce_hours = 5, -- at least 5 hours between attempts to install/update

			-- By default all integrations are enabled. If you turn on an integration
			-- and you have the required module(s) installed this means you can use
			-- alternative names, supplied by the modules, for the thing that you want
			-- to install. If you turn off the integration (by setting it to false) you
			-- cannot use these alternative names. It also suppresses loading of those
			-- module(s) (assuming any are installed) which is sometimes wanted when
			-- doing lazy loading.
			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = true,
				["mason-nvim-dap"] = true,
			},
		})
		require("mason-lspconfig").setup()
		local servers = {
			-- clangd = {},
			-- gopls = {},
			-- pyright = {},
			ruff = {filetypes={'python'}},
			-- rust_analyzer = {},
			-- tsserver = {},
			-- html = { filetypes = { 'html', 'twig', 'hbs'} },
			nil_ls = {},
			lua_ls = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		}

		-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Ensure the servers above are installed
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})
	end,
}
