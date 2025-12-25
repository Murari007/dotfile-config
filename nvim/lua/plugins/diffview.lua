return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- required
  config = function()
    local diffview = require("diffview")

    diffview.setup({
      use_icons = true,
      enhanced_diff_hl = true,
      file_panel = {
        listing_style = "tree",
        win_config = {
          position = "left",
          width = 35,
        },
      },
    })
  end,
}

