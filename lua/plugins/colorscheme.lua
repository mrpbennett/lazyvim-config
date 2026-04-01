-- https://github.com/catppuccin/nvim
-- https://github.com/booberrytheme/boo-berry.nvim
-- https://github.com/Mofiqul/dracula.nvim
return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.special.bufferline").get_theme()
          end
        end,
      },
    },
  },

  -- dracula
  { "Mofiqul/dracula.nvim" },
  -- boo-berry
  { "mrpbennett/boo-berry.nvim" },
  -- gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- vault
  { "mrpbennett/vault" },
  --
  -- Set Theme here:
  -- opts:
  --  catppuccin
  --  dracula
  --  boo-berry
  --  gruvbox
  --  vault
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
