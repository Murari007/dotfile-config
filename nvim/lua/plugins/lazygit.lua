return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },

  keys = {
    -- Safe call: Forces LazyGit to open in an unmodified new tab
    { "<leader>g", "<cmd>tabnew | LazyGit<cr>", desc = "LazyGit" },
  },
}

