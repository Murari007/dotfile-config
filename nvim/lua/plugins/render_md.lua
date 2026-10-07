return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = false,
  ft = { "markdown" },
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

