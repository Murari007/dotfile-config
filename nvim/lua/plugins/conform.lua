return {
	"stevearc/conform.nvim",
	-- Lazy load the plugin
	event = { "BufReadPre", "BufNewFile" },

	-- Configuration function
	config = function()
		-- Directly set up conform here instead of using a separate module
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				cpp = { "clang_format" },
				python = { "autopep8" },
				-- python = {"isort"},
				lua = { "stylua" },
				xml = { "prettier" },
			},
		})

		-- Key mapping for formatting
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				async = true,
				lsp_fallback = true,
				timeout_ms = 500,
			})
		end, { desc = "Format buffer" })
	end,
}
