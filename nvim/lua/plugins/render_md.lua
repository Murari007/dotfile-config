return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown" }, -- load only for markdown files
  opts = {
    -- Example settings (all are optional)
    heading = {
      enabled = true,
      icons = { " ", " ", " " }, -- different icons per heading level
    },
    bullet = {
      enabled = true,
      icons = { "•", "◦", "▪" },
    },
    checkbox = {
      enabled = false, -- Disabled due to crash: attempt to get length of local 's' (a nil value)
      checked = " ",
      unchecked = " ",
    },
    quote = {
      enabled = true,
      icon = "❝",
    },
    code = {
      enabled = true,
      style = "full", -- or "simple"
    },
  },
}

