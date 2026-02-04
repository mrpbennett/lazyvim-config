return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    ---
    dashboard = {
      enabled = true,
      example = "compact_files",
    },
    ---
    dim = {
      enabled = true,
    },
    ---
    image = {
      enabled = true,
    },
    ---
    picker = {
      sources = {
        explorer = {
          ignored = true,
        },
      },
    },
    ---
  },
  ---
}
