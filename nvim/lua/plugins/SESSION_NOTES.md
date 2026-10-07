# Session Notes

## Goal
Improve Claude Code terminal UX in nvim: exit chat window cleanly, kill agent terminal. (Gemini deferred — user chose Claude-only.)

## Root cause
- claudecode.nvim `<leader>af` focus works from editor (auto_insert default true), but config had **zero terminal-mode keymaps** — inside Claude terminal every key goes to CLI; only manual `<C-\><C-n>` escaped.
- Kill existed as unmapped `ClaudeCodeClose` (snacks `terminal:close()` deletes buffer → kills process). `<leader>ac` toggle only hides.
- gemini.lua spec fully commented out — plugin dead, its keymaps inactive.

## Files changed
- `claudecode.lua`:
  - `config = true` → function: setup + TermOpen autocmd (pattern `*claude*`) mapping t-mode `<C-i>` → `<C-\><C-n>`, buffer-local.
  - Added `{ "<leader>ak", "<cmd>ClaudeCodeClose<cr>" }` kill key.

## Known risk
`<C-i>` == Tab in terminals without CSI-u/kitty protocol — Tab inside Claude chat may exit terminal mode instead. User warned, chose `<C-i>` anyway (rejected `<Esc><Esc>`, plain `I`).

## Next step
User restart nvim / `:Lazy reload claudecode.nvim`, test: `<leader>ac` open → type → `<C-i>` exit → `<leader>ak` kill. If Tab broken in chat, switch map to `<A-i>`.
