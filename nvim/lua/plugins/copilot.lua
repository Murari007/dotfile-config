return {
  "github/copilot.vim",
  config = function()
    -- Optional: Customize Copilot settings here
    vim.g.copilot_no_tab_map = true -- disables default <Tab> mapping
    vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
  end
}
