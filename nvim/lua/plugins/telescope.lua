-- return {
-- 	{
-- 		"nvim-telescope/telescope-ui-select.nvim",
-- 	},
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		-- tag = "0.1.5",
--     branch = "master",
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 		config = function()
-- 			require("telescope").setup({
-- 				defaults = {
-- 					preview = {
-- 						show_line = false,
-- 					},
-- 					mappings = {
-- 						i = {
-- 							["<C-v>"] = "select_vertical",
-- 							["<C-h>"] = "select_horizontal",
-- 						},
-- 					},
-- 				},
-- 				extensions = {
-- 					["ui-select"] = {
-- 						require("telescope.themes").get_dropdown({}),
-- 					},
-- 				},
-- 			})
-- 			local builtin = require("telescope.builtin")
-- 			vim.keymap.set("n", "<C-f>", builtin.find_files, {})
-- 			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- 			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
-- 			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
-- 			vim.keymap.set("n", "gr", builtin.lsp_references, {})
-- 			vim.keymap.set("n", "gI", builtin.lsp_implementations, {})
-- 			vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})
-- 			vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })
--
-- 			-- Insert mode (will exit insert mode, undo, and return to insert mode)
-- 			vim.keymap.set("i", "<C-z>", "<Esc>ua", { noremap = true, silent = true })
--
-- 			require("telescope").load_extension("ui-select")
-- 		end,
-- 	},
-- }
--

return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					preview = {
						show_line = true,
						hide_on_startup = false,
						treesitter = true,
					},
					layout_config = {
						horizontal = {
							preview_width = 0.65,
						},
						vertical = {
							preview_height = 0.5,
						},
						preview_cutoff = 120,
					},
					mappings = {
						i = {
							["<C-v>"] = "select_vertical",
							["<C-h>"] = "select_horizontal",
						},
					},
				},
				pickers = {
					lsp_definitions = {
						show_line = true,
						previewer = true,
					},
					lsp_references = {
						show_line = true,
						previewer = true,
					},
					lsp_implementations = {
						show_line = true,
						previewer = true,
					},
					lsp_type_definitions = {
						show_line = true,
						previewer = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-f>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

			-- For LSP pickers, you might want to use these with preview enabled
			vim.keymap.set("n", "gd", function()
				builtin.lsp_definitions({ show_line = true, previewer = true })
			end, {})

			vim.keymap.set("n", "gr", function()
				builtin.lsp_references({ show_line = true, previewer = true })
			end, {})

			vim.keymap.set("n", "gI", function()
				builtin.lsp_implementations({ show_line = true, previewer = true })
			end, {})

			vim.keymap.set("n", "gt", function()
				builtin.lsp_type_definitions({ show_line = true, previewer = true })
			end, {})

			vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })
			vim.keymap.set("i", "<C-z>", "<Esc>ua", { noremap = true, silent = true })

			require("telescope").load_extension("ui-select")
		end,
	},
}
