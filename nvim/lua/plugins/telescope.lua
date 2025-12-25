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
					preview = {
						show_line = true, -- Changed from false to true to enable line preview
						hide_on_startup = false, -- Ensure preview isn't hidden by default
						treesitter = true, -- Enable treesitter for better syntax highlighting
					},
					layout_config = {
						horizontal = {
							preview_width = 0.65, -- 65% preview pane width
							-- preview_width = 0.5, -- or fixed size: 80
						},
						vertical = {
							preview_height = 0.5, -- 50% preview height
						},
						preview_cutoff = 120, -- hide preview when window is too narrow
					},
					pickers = {
						lsp_definitions = {
							show_line = true, -- Enable preview for definitions
							previewer = true, -- Ensure previewer is enabled
						},
						lsp_references = {
							show_line = true, -- Enable preview for references
							previewer = true, -- Ensure previewer is enabled
						},
						lsp_implementations = {
							show_line = true, -- Enable preview for implementations
							previewer = true,
						},
						lsp_type_definitions = {
							show_line = true, -- Enable preview for type definitions
							previewer = true,
						},
					},
					mappings = {
						i = {
							["<C-v>"] = "select_vertical",
							["<C-h>"] = "select_horizontal",
						},
					},
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
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
