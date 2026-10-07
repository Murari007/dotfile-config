return {
  "nvim-lua/plenary.nvim",
  lazy = true,
  config = function() end,
  init = function()
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*.md",
      callback = function()
        local file = vim.fn.expand("%:p")
        if file == "" then return end

        vim.schedule(function()
          local term_buf = vim.api.nvim_create_buf(false, true)
          vim.api.nvim_win_set_buf(0, term_buf)
          vim.fn.termopen("leaf " .. vim.fn.shellescape(file), {
            on_exit = function()
              vim.api.nvim_buf_delete(term_buf, { force = true })
            end,
          })
          vim.cmd("startinsert")
        end)
      end,
    })
  end,
}
