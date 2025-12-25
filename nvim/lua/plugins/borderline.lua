return {
  'mikesmithgh/borderline.nvim',
  enabled = true,
  lazy = false,
  -- event = 'VeryLazy',
  config = function()
    require('borderline').setup({
      -- Your custom border settings here
      -- For example:
      style = "rounded",
      highlight = "FloatBorder",
    })
  end,
}
