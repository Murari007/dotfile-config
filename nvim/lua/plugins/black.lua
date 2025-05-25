return {
	"psf/black",
	ft = "python",
	config = function()
		-- Automatically format file buffer when saving
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			pattern = "*.py",
			callback = function()
				vim.cmd("!black %")
			end,
		})
	end,
}
