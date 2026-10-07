return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"black",
				"debugpy",
				"flake8",
				"isort",
				"mypy",
				"pylint",
				"clangd",
				"markdown-toc",
				"codelldb",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = { "pyright", "pylsp" },
			handlers = {
				function(server)
					local opts = {
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					}
					require("lspconfig")[server].setup(opts)
				end,
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
			--[[ require("mason-lspconfig").setup_handlers({
				function(server)
					local opts = {
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					}
					require("lspconfig")[server].setup(opts)
				end,
			}) ]]
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- New API (Neovim ≥ 0.11 + lspconfig v3)
			local function setup(server, opts)
				vim.lsp.config(
					server,
					vim.tbl_deep_extend("force", {
						capabilities = capabilities,
					}, opts or {})
				)
				vim.lsp.enable(server)
			end

			-- Servers
			setup("ts_ls")
			setup("solargraph")
			setup("html")
			setup("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim", "_G" } },
						telemetry = { enable = false },
					},
				},
			})
			setup("clangd", {
				cmd = {
					"clangd",
					"--header-insertion=never",
					-- "--cache-dir=" .. vim.fn.expand("~/.cache/exsl-sw/clangd"),
					-- "--compile-commands-dir=" .. vim.fn.expand("~/iree-exsl-sw-build"),
				},
			})
			setup("opencl_ls")
			setup("pyright", {
				filetypes = { "python" },
			})
			setup("pylsp", {
				configurationSources = {},
			})
			setup("mlir_lsp_server")
			setup("mlir_pdll_lsp_server")

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
