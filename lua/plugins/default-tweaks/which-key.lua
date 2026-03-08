-- https://github.com/folke/which-key.nvim
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        {
          { "<leader>t", group = "tools", icon = { icon = "󱁤" } },
        },
      },
    },
  },
}
