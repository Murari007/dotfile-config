return {
	-- This is a configuration plugin to set up window separators (borders)
	{
		dir = vim.fn.stdpath("config"), -- Point to the config directory to avoid fetching a repo
		name = "ui-borders-config",
		lazy = false, -- Run immediately
		priority = 1000, -- Run early
		config = function()
			-- Set the characters used for window separators to create a "border" look
			vim.opt.fillchars:append({
				vert = "│",
				horiz = "─",
				eob = " ", -- Hides the '~' characters at the end of the buffer
				horizup = "┴",
				horizdown = "┬",
				vertleft = "┤",
				vertright = "├",
				verthoriz = "┼",
			})

			-- Optional: Set a global statusline to create a bottom border effect
			vim.opt.laststatus = 3
		end,
	},
}
