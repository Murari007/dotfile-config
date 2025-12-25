return {
	{
		-- "yashguptaz/calvera-dark.nvim",
		-- "EdenEast/nightfox.nvim",
		-- "loctvl842/monokai-pro.nvim",
		-- "rebelot/kanagawa.nvim",
		"Murari007/night-owl.nvim",
		-- "darianmorat/gruvdark.nvim",
		-- "folke/tokyonight.nvim",
		lazy = false,
		name = "nightowl",
		priority = 1000,
		opt = {
			transparent_background = true,
		},
		config = function()
			-- vim.cmd.colorscheme("kanagawa-dragon")
			-- vim.cmd.colorscheme("monokai-pro")
			-- vim.cmd.colorscheme("calvera")
			vim.cmd.colorscheme("night-owl")
			-- vim.cmd.colorscheme("gruvdark")
			-- vim.cmd.colorscheme("tokyonight-moon")
			vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
			vim.api.nvim_set_hl(0, "LineNr", { bg = "None" })
			vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })
			-- vim.cmd([[
			--         highlight DiffAdd guifg=None guibg=#004011
			--         highlight DiffDelete guifg=None guibg=#BD6265
			--            ]])
		end,
	},
}
