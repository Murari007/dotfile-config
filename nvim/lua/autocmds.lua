vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.pdf",
-- group = vim.api.nvim_create_augroup("BinaryFilesPDF", { clear = true }),
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("silent !zathura " .. filename .. " &")
		vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
	end,
})

-- Image files handler
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
-- group = vim.api.nvim_create_augroup("BinaryFilesImage", { clear = true }),
	callback = function()
		local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
		vim.cmd("silent !feh " .. filename .. " &")
		vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
	end,
})

vim.cmd('source ~/.config/nvim/mlir.vim')
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.mlir",
  callback = function()
    vim.bo.filetype = "mlir"
  end
})
