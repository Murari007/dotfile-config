return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  -- Also trigger when opening files in the vault
  event = {
    "BufReadPost " .. vim.fn.expand("~") .. "/Documents/Obsidian\\ Vault/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian\\ Vault/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",        -- for link completion
    "nvim-telescope/telescope.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian Vault",
      },
    },

    -- Daily notes config (optional)
    daily_notes = {
      folder = "Daily",
      date_format = "%Y-%m-%d",
      template = nil,
    },

    -- Completion for [[wiki-links]]
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    -- Note ID format: use title as-is (kebab-case friendly)
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,

    -- Open notes in current buffer (not a new split)
    open_notes_in = "current",

    -- Use telescope for search
    picker = {
      name = "telescope.nvim",
    },

    -- UI: disable built-in UI to avoid conflict with render-markdown.nvim
    ui = {
      enable = false,
    },

    -- Keymaps (only active in markdown buffers inside the vault)
    mappings = {
      -- Follow link under cursor
      ["gf"] = {
        action = function() return require("obsidian").util.gf_passthrough() end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle checkbox
      ["<leader>oc"] = {
        action = function() return require("obsidian").util.toggle_checkbox() end,
        opts = { buffer = true, desc = "Toggle checkbox" },
      },
      -- Smart action: follow link or create note
      ["<cr>"] = {
        action = function() return require("obsidian").util.smart_action() end,
        opts = { buffer = true, expr = true, desc = "Smart action (follow link / create note)" },
      },
    },
  },

  -- Global keymaps for vault navigation
  keys = {
    { "<leader>on", "<cmd>ObsidianNew<cr>",           desc = "New note" },
    { "<leader>oo", "<cmd>ObsidianOpen<cr>",          desc = "Open in Obsidian app" },
    { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>",   desc = "Find note" },
    { "<leader>og", "<cmd>ObsidianSearch<cr>",        desc = "Grep vault" },
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",     desc = "Show backlinks" },
    { "<leader>ot", "<cmd>ObsidianTags<cr>",          desc = "Browse tags" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>",       desc = "Daily notes" },
    { "<leader>oT", "<cmd>ObsidianTemplate<cr>",      desc = "Insert template" },
    { "<leader>ol", "<cmd>ObsidianLinks<cr>",         desc = "List links in note" },
    { "<leader>or", "<cmd>ObsidianRename<cr>",        desc = "Rename note (updates links)" },
    { "<leader>os", "<cmd>ObsidianTOC<cr>",           desc = "Table of contents" },
    -- Visual: create link from selection
    { "<leader>ol", "<cmd>ObsidianLink<cr>",          mode = "v", desc = "Link selection" },
    { "<leader>oL", "<cmd>ObsidianLinkNew<cr>",       mode = "v", desc = "Link → new note" },
  },
}
