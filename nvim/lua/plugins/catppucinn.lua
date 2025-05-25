return {
	{
		-- "yashguptaz/calvera-dark.nvim",
		-- "EdenEast/nightfox.nvim",
		-- "loctvl842/monokai-pro.nvim",
    -- "rebelot/kanagawa.nvim",
    "Murari007/night-owl.nvim",
		lazy = false,
		name = "nightowl",
		priority = 1000,
    opt = {
    transparent_background = true
    },
		config = function()
			-- vim.cmd.colorscheme("kanagawa-dragon")
			-- vim.cmd.colorscheme("monokai-pro")
      -- vim.cmd.colorscheme("calvera")
		     vim.cmd.colorscheme("night-owl")
		     vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
			   vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000" })
		end,
	},
}
