-- molten-cells.lua
-- Visual cell decoration for molten-nvim: separators, gutter signs, and toast notifications.
-- Loaded after molten initializes via event = "User MoltenInitPost".

local M = {}

local ns = vim.api.nvim_create_namespace("molten_cell_sep")
local sign_group = "molten_signs"
local last_cell_lnum = {} -- bufnr -> lnum of most recently activated cell

local function setup_highlights()
  vim.api.nvim_set_hl(0, "MoltenCellSeparator", { fg = "#3e4452" })
  vim.api.nvim_set_hl(0, "MoltenSignIdle",      { fg = "#5c6370" })
  vim.api.nvim_set_hl(0, "MoltenSignRunning",   { fg = "#98c379" })
  vim.api.nvim_set_hl(0, "MoltenSignDone",      { fg = "#61afef" })
  vim.api.nvim_set_hl(0, "MoltenSignError",     { fg = "#e06c75" })
end

local function setup_signs()
  vim.fn.sign_define("MoltenSignIdle",    { text = "○", texthl = "MoltenSignIdle" })
  vim.fn.sign_define("MoltenSignRunning", { text = "●", texthl = "MoltenSignRunning" })
  vim.fn.sign_define("MoltenSignDone",    { text = "✓", texthl = "MoltenSignDone" })
  vim.fn.sign_define("MoltenSignError",   { text = "✗", texthl = "MoltenSignError" })
end

local function draw_separators(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  if ft ~= "python" and ft ~= "json" and ft ~= "ipynb" then return end

  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local line_count = vim.api.nvim_buf_line_count(bufnr)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, line_count, false)
  local winid = vim.fn.bufwinid(bufnr)
  local width = (winid ~= -1 and vim.api.nvim_win_get_width(winid) or vim.api.nvim_win_get_width(0)) - 4

  for i, line in ipairs(lines) do
    if line:match("^%s*#%s*%%%%") then
      local sep = string.rep("─", width)
      vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
        virt_lines = { { { sep, "MoltenCellSeparator" } } },
        virt_lines_above = true,
      })
    end
  end
end

local function setup_separator_autocmds()
  local aug = vim.api.nvim_create_augroup("MoltenCellSeparators", { clear = true })

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    group = aug,
    pattern = { "*.py", "*.ipynb" },
    callback = function(ev)
      draw_separators(ev.buf)
    end,
  })

  local pending = {}
  vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    group = aug,
    pattern = { "*.py", "*.ipynb" },
    callback = function(ev)
      local bufnr = ev.buf
      if not pending[bufnr] then
        pending[bufnr] = true
        vim.schedule(function()
          pending[bufnr] = nil
          if vim.api.nvim_buf_is_valid(bufnr) then
            draw_separators(bufnr)
          end
        end)
      end
    end,
  })
end

local function place_sign(bufnr, lnum, sign_name)
  vim.fn.sign_unplace(sign_group, { buffer = bufnr })
  vim.fn.sign_place(0, sign_group, sign_name, bufnr, { lnum = lnum, priority = 10 })
end

local function current_cell_marker_line(bufnr)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local cur_line = cursor[1]
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, cur_line, false)
  for i = #lines, 1, -1 do
    if lines[i]:match("^%s*#%s*%%%%") then
      return i
    end
  end
  return nil
end

local function setup_sign_autocmds()
  local aug = vim.api.nvim_create_augroup("MoltenCellSigns", { clear = true })

  vim.api.nvim_create_autocmd("User", {
    group = aug,
    pattern = "MoltenCellEnter",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local lnum = current_cell_marker_line(bufnr)
      if lnum then
        last_cell_lnum[bufnr] = lnum
        place_sign(bufnr, lnum, "MoltenSignIdle")
      end
    end,
  })

  -- NOTE: Verify this event fires with: :verbose autocmd User Molten*
  -- If MoltenEvaluateOperator doesn't fire for all evaluate commands,
  -- try "MoltenEvaluateLine" or check which events are actually available.
  vim.api.nvim_create_autocmd("User", {
    group = aug,
    pattern = "MoltenEvaluateOperator",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local lnum = current_cell_marker_line(bufnr)
      if lnum then
        last_cell_lnum[bufnr] = lnum
        place_sign(bufnr, lnum, "MoltenSignRunning")
      end
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    group = aug,
    pattern = "MoltenOutputDone",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      -- Use the stored lnum from when execution started, not the current cursor
      local lnum = last_cell_lnum[bufnr]
      local has_error = vim.b[bufnr].molten_has_error
      if lnum then
        place_sign(bufnr, lnum, has_error and "MoltenSignError" or "MoltenSignDone")
      end
      if has_error then
        vim.notify("cell error", vim.log.levels.ERROR)
      else
        vim.notify("cell executed", vim.log.levels.INFO)
      end
    end,
  })
end

M.setup = function()
  setup_highlights()
  setup_signs()
  setup_separator_autocmds()
  setup_sign_autocmds()
end

return {
  "benlubas/molten-nvim",
  lazy = true,
  event = "User MoltenInitPost",
  config = function()
    M.setup()
  end,
}
