return {
  "amitds1997/remote-nvim.nvim",
  version = "*", -- Pin to the latest version
  dependencies = {
    "nvim-lua/plenary.nvim",
    "muniftanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("remote-nvim").setup({
      -- Configuration for devpod, ssh, etc.
      -- Leaving defaults is usually best for getting started
    })
  end,
}
