-- return {
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			local config = require("nvim-treesitter.configs")
-- 			config.setup({
-- 				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
-- 				auto_install = true,
-- 				highlight = {
-- 					enable = true,
-- 					use_languagetree = true,
-- 				},
-- 				indent = { enable = true },
-- 				-- -- 🌈 Rainbow brackets
-- 				-- rainbow = {
-- 				-- 	enable = true,
-- 				-- 	extended_mode = true,
-- 				-- 	max_file_lines = nil,
-- 				-- },
-- 			})
-- 		end,
-- 	},
-- }

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- build/update parsers
    opts = {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "python",
        "cpp",
      },
      auto_install = true,
      highlight = { enable = true, use_languagetree = true },
      indent = { enable = true },
    },
  },
}
