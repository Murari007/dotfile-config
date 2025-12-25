-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		opts = {
-- 			auto_install = true,
-- 			ensure_installed = { "pyright", "pylsp" },
-- 		},
-- 	},
-- 	{
-- 		"WhoIsSethDaniel/mason-tool-installer.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason-tool-installer").setup({
-- 				-- Install these linters, formatters, debuggers automatically
-- 				ensure_installed = {
-- 					"black",
-- 					"debugpy",
-- 					"flake8",
-- 					"isort",
-- 					"mypy",
-- 					"pylint",
-- 					"clangd",
-- 					"markdown-toc",
-- 				},
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- 			local lspconfig = require("lspconfig")
-- 			lspconfig.ts_ls.setup({
-- 				capabilities = capabilities,
-- 			})
-- 			lspconfig.solargraph.setup({
-- 				capabilities = capabilities,
-- 			})
-- 			lspconfig.html.setup({
-- 				capabilities = capabilities,
-- 			})
-- 			lspconfig.lua_ls.setup({
-- 				capabilities = capabilities,
-- 				settings = {
-- 					Lua = {
-- 						diagnostics = {
-- 							globals = { "vim", "_G" },
-- 						},
-- 					},
-- 					telemetry = {
-- 						enable = false,
-- 					},
-- 				},
-- 			})
-- 			lspconfig.clangd.setup({
-- 				capabilities = capabilities,
-- 				cmd = { "clangd", "--header-insertion=never" },
-- 			})
-- 			lspconfig.opencl_ls.setup({
-- 				capabilities = capabilities,
-- 			})
-- 			lspconfig.pyright.setup({
-- 				capabilities = capabilities,
-- 				filetpes = { "python" },
-- 			})
-- 			lspconfig.pylsp.setup({
-- 				capabilities = capabilities,
-- 				configurationSources = {},
-- 			})
-- 			lspconfig.mlir_lsp_server.setup({
-- 				capabilities = capabilities,
-- 			})
-- 			lspconfig.mlir_pdll_lsp_server.setup({
-- 				capabilities = capabilities,
-- 			})
--
-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- 			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- 		end,
-- 	},
-- }
--
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = { "pyright", "pylsp" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"black",
					"debugpy",
					"flake8",
					"isort",
					"mypy",
					"pylint",
					"clangd",
					"markdown-toc",
				},
			})
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
