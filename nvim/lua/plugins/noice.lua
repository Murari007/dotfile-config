return {
  "folke/noice.nvim",
  enabled = true,
  event = "VimEnter",
  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        search_down = { view = "cmdline_popup" },
        search_up = { view = "cmdline_popup" },
      },
      opts = {
        border = { style = "single" },
      },
    },
    messages = {
      enabled = true,
      view_search = "virtualtext",
      view = "notify",
    },
    routes = {
      {
        view = "mini",
        filter = {
          event = "notify",
          any = {
            { find = "cell executed" },
          },
        },
      },
      {
        view = "notify",
        filter = {
          event = "notify",
          any = {
            { find = "cell error" },
          },
        },
      },
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      {
        view = "mini", -- Modern, unobtrusive status for Molten/Kernel
        filter = {
          event = "msg_show",
          any = {
            { find = "Molten" },
            { find = "kernel" },
            { find = "cell" },
          },
        },
        opts = { skip = false },
      },
    },
    views = {
      cmdline_popup = {
        position = { row = "10%", col = "50%" },
        size = { width = "60%", height = "auto" },
        border = { style = "single" },
      },
      cmdline_popupmenu = {
        relative = "editor",
        position = { row = "13%", col = "50%" },
        size = { width = "60%", height = "auto" },
        border = { style = "single" },
      },
    },
    lsp = {
      hover = { enabled = true },
      signature = { enabled = true },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = false,  -- position search at bottom
      command_palette = true, -- enhanced command palette
      long_message_to_split = true, -- long messages in split
      inc_rename = true, -- incremental rename
      lsp_doc_border = true, -- border for LSP hover/signature
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
