return {
  {
    "NakLast/antigravity-cli.nvim",
    keys = {
      { "<leader>ua", "<cmd>Antigravity<cr>", desc = "Toggle Antigravity" },
      { "<leader>us", function() require("antigravity").ask_selection() end, mode = { "n", "v" }, desc = "Send selection to Antigravity" },
    },
    config = function()
      require("antigravity").setup({
        -- You can override the default command here if needed
        cmd = "agy",
        width_ratio = 0.3,
        height_ratio = 0.8,
        border = "rounded",
      })

      -- Terminal-mode escape hatch, only inside the Antigravity terminal buffer
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = { "*agy*", "*antigravity*" },
        callback = function(ev)
          vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], { buffer = ev.buf, desc = "Exit Antigravity terminal mode" })
        end,
      })
    end,
  },
}
