return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        signcolumn = true,   -- show symbols in gutter
        numhl      = false,  -- highlight line numbers
        linehl     = false,  -- highlight whole line
        word_diff  = false,
      })
    end,
  },
}

