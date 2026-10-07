return {
	"p00f/clangd_extensions.nvim",
	dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },

	config = function()
		local clangd_ext = require("clangd_extensions")

		clangd_ext.setup({
			server = {
				on_attach = function(client, bufnr)
					local opts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},

			ast = {
				role_icons = {
					type = "🄣",
					declaration = "🄓",
					expression = "🄔",
					statement = ";",
					specifier = "🄢",
					["template argument"] = "🆃",
				},
				kind_icons = {
					Compound = "🄲",
					Recovery = "🅁",
					TranslationUnit = "🅄",
					PackExpansion = "🄿",
					TemplateTypeParm = "🅃",
					TemplateTemplateParm = "🅃",
					TemplateParamObject = "🅃",
				},
				highlights = {
					detail = "Comment",
				},
			},

			memory_usage = { border = "single" },
			symbol_info = { border = "single" },
		})
	end,
}
