vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "dark"
vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true }) -- move line down (normal mode)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true }) -- move line up (normal mode)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- move line down (visual mode)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- move line up (visual mode)
vim.keymap.set("n", "<A-a>", 'gg"+yG', { noremap = true, silent = true, desc = "Copy entire file" }) -- Copy entire file content (Alt+a)
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select entire file" }) -- Select entire file content (Normal mode → Visual mode)
vim.keymap.set("v", "<A-c>", '"+y', { noremap = true, silent = true, desc = "Copy selection to clipboard" }) -- Copy selection to system clipboard (visual mode)
vim.keymap.set("v", "<A-x>", '"+d', { noremap = true, silent = true, desc = "Cut selection to clipboard" }) -- Cut selection to system clipboard (Visual mode)
vim.keymap.set("n", "<A-t>", ":bNext<CR>", { noremap = true, silent = true, desc = "Next Tab Page" }) -- Go to next tab page
vim.keymap.set("n", "<c-r>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous Tab Page" }) -- Go to previous tab page
-- Keymap: <leader>tt to toggle Tmux pane
vim.keymap.set("n", "<leader>tt", function()
  require("config.keymaps").toggle()
end, { desc = "Toggle Tmux Pane" })

-- User command: :TmuxToggle
vim.api.nvim_create_user_command("TmuxToggle", function()
  require("config.keymaps").toggle()
end, { desc = "Toggle Tmux Pane" })

