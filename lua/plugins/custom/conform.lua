return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "sqruff" },
      yaml = { "yamlfmt" }, -- Replace default with K8s-friendly formatter
    },
    formatters = {
      sqruff = {
        command = "sqruff",
        args = { "fix", "--config", vim.fn.expand("~/.config/sqruff/.sqruff"), "-" },
        stdin = true,
      },
      yamlfmt = {
        command = "yamlfmt",
        args = { "-in" },
        stdin = true,
      },
    },
  },
}
