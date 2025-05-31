return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.5",
    branch = "master",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
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
			vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true })

			-- Insert mode (will exit insert mode, undo, and return to insert mode)
			vim.keymap.set("i", "<C-z>", "<Esc>ua", { noremap = true, silent = true })

			require("telescope").load_extension("ui-select")
		end,
	},
}
