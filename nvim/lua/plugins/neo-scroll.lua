return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require('neoscroll')
    require('neoscroll').setup({
      mappings = {}, -- Disable all default mappings
    })

    -- Custom scroll mappings
    vim.keymap.set({'n', 'v', 'x'}, '<C-u>', function()
      neoscroll.scroll(-vim.wo.scroll, {
        move_cursor = true,
        duration = 200,
      })
    end, { silent = true })

    vim.keymap.set({'n', 'v', 'x'}, '<C-d>', function()
      neoscroll.scroll(vim.wo.scroll, {
        move_cursor = true,
        duration = 200,
      })
    end, { silent = true })
  end
}
