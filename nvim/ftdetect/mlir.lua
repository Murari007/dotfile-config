vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.mlir", callback = function() vim.bo.filetype = "mlir" end })
