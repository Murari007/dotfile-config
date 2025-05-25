return {
	"shortcuts/no-neck-pain.nvim",
	version = "*", -- optional, but recommended for stability
	opts = {
		-- Default options
		width = 125,
		buffers = {
			right = {
				enabled = true, -- disable right buffer by default
			},
		},
	},
	keys = {
		-- Key mappings
		{ "<leader>n", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" },
	},
}
