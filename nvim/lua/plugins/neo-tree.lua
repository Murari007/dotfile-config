-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	config = function()
-- 		vim.keymap.set("n", "<leader>l", function()
-- 			-- Check if current buffer has a valid file
-- 			if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
-- 				require("neo-tree.command").execute({ reveal = true, position = "left" })
-- 			else
-- 				require("neo-tree.command").execute({ position = "left" })
-- 			end
-- 		end, { silent = true, noremap = true })
--
-- 		vim.keymap.set("n", "<leader>r", function()
-- 			if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
-- 				require("neo-tree.command").execute({ reveal = true, position = "right" })
-- 			else
-- 				require("neo-tree.command").execute({ position = "right" })
-- 			end
-- 		end, { silent = true, noremap = true })
--
-- 		vim.keymap.set("n", "<leader>bf", function()
-- 			require("neo-tree.command").execute({ source = "buffers", position = "float" })
-- 		end, { silent = true, noremap = true })
--
-- 		vim.keymap.set("n", "<leader>t", function()
-- 			require("neo-tree.command").execute({ toggle = true })
-- 		end, { silent = true, noremap = true })
-- 	end,
-- }


return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Disable netrw (alternative to vim.g.loaded_netrw = 1)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Set termguicolors for better UI
    vim.opt.termguicolors = true

    -- Keymaps
    vim.keymap.set("n", "-", ":NeoTreeFocusToggle<CR>", { silent = true, noremap = true })

    require("neo-tree").setup({
      close_if_last_window = false, -- Keep Neo-tree open if it's the last window
      popup_border_style = "rounded",
      default_component_configs = {
        indent = {
          indent_size = 1,
        },
      },
      window = {
        position = "float",
        width = 0.5, -- Similar to your WIDTH_RATIO
        height = 0.8, -- Similar to your HEIGHT_RATIO
        mappings = {
          ["<space>"] = "none", -- Disable default mapping
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
          },
        },
        follow_current_file = {
          enabled = true, -- Similar to your reveal behavior
        },
        hijack_netrw_behavior = "open_default", -- Similar to hijack_netrw
      },
      float = {
        -- Custom float configuration similar to your nvim-tree setup
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * 0.5 -- WIDTH_RATIO
          local window_h = screen_h * 0.8 -- HEIGHT_RATIO
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
          return {
            border = "rounded",
            relative = "editor",
            row = center_y,
            col = center_x,
            width = window_w_int,
            height = window_h_int,
          }
        end,
      },
    })

    -- Additional keymaps from your original config
    vim.keymap.set("n", "<leader>l", function()
      if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
        require("neo-tree.command").execute({ reveal = true, position = "left" })
      else
        require("neo-tree.command").execute({ position = "left" })
      end
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "<leader>r", function()
      if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
        require("neo-tree.command").execute({ reveal = true, position = "right" })
      else
        require("neo-tree.command").execute({ position = "right" })
      end
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "<leader>bf", function()
      require("neo-tree.command").execute({ source = "buffers", position = "float" })
    end, { silent = true, noremap = true })

    vim.keymap.set("n", "<leader>t", function()
      require("neo-tree.command").execute({ toggle = true })
    end, { silent = true, noremap = true })
  end,
}

