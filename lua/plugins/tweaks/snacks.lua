-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#general
return {
  -- lazy.nvim
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          explorer = {
            ignored = true,
          },
        },
      },
    },
  },
}
