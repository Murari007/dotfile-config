return {
  'mikesmithgh/borderline.nvim',
  enabled = true,
  lazy = false,
  -- event = 'VeryLazy',
  config = function()
    -- Mock fzf-lua.init to avoid borderline.nvim error if fzf-lua is not installed
    if not pcall(require, 'fzf-lua.init') then
      package.preload['fzf-lua.init'] = function()
        return {}
      end
    end

    require('borderline').setup({
      -- Your custom border settings here
      -- For example:
      style = "single",
      highlight = "FloatBorder",
    })
  end,
}
