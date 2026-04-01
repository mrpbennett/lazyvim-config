-- https://github.com/mfussenegger/nvim-lint
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      yaml = { "yamllint" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    lint.linters_by_ft = opts.linters_by_ft
    lint.linters.yamllint.cwd = function()
      return vim.fs.root(0, { ".yamllint", ".git" }) or vim.fn.getcwd()
    end
  end,
}
