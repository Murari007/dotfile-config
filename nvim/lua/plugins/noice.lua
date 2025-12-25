return {
	"folke/noice.nvim",
  enabled = true,
	event = "VimEnter",
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {
				border = {
					style = "rounded",
				},
			},
		},
		-- messages = {
		-- 	enabled = true,
		-- 	view_search = "virtualtext",
		-- 	view = "cmdline_popup",
		-- },
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = "10%",
					col = "50%",
				},
				-- size = {
				-- 	width = "60%",
				-- 	height = "auto",
				-- },
			},
			cmdline_popupmenu = {
				relative = "editor",
				position = {
					row = "13%",
					col = "50%",
				},
				size = {
					width = "60%",
					height = "auto",
				},
				border = {
					style = "rounded",
				},
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
