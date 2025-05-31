return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				cpp = { "clang_format" },
				python = { "autopep8", "black" },
				lua = { "stylua" },
				xml = { "prettier" },
			},
		})

		-- Key mapping for formatting
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				async = true,
				-- lsp_fallback = true,
				-- lsp_format = "fallback",
				timeout_ms = 500,
			})
		end, { desc = "Format buffer" })
	end,
}
