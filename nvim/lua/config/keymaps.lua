local M = {}

M.toggle = function()
  -- pane direction: "right" or "bottom"
  local pane_direction = vim.g.tmux_pane_direction or "right"

  -- size based on direction
  local pane_size = (pane_direction == "right") and 60 or 15
  local move_key = (pane_direction == "right") and "C-l" or "C-k"
  local split_cmd = (pane_direction == "right") and "-h" or "-v"

  -- check pane count
  local has_panes =
    vim.fn.system("tmux list-panes | wc -l"):gsub("%s+", "") ~= "1"

  -- check if current pane is zoomed
  local is_zoomed =
    vim.fn.system("tmux display-message -p '#{window_zoomed_flag}'")
      :gsub("%s+", "") == "1"

  if has_panes then
    if is_zoomed then
      -- unzoom and jump
      vim.fn.system("tmux resize-pane -Z")
      vim.fn.system("tmux send-keys " .. move_key)
    else
      -- zoom the terminal pane
      vim.fn.system("tmux resize-pane -Z")
    end

  else
    -- create a new pane without cd logic
    vim.fn.system(
      "tmux split-window "
        .. split_cmd
        .. " -l "
        .. pane_size
        .. " 'zsh'"
    )

    vim.fn.system("tmux send-keys " .. move_key)
    -- vim.fn.system("tmux send-keys Escape i") -- optional vi-mode fix
  end
end

return M

