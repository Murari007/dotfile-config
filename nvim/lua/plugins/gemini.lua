return {
	"jonroosevelt/gemini-cli.nvim",
	config = function()
		vim.o.splitright = true
		require("gemini").setup({
			split_direction = "vertical",
		})
  end,
}
