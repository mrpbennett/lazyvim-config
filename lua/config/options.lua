-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.codeium_os = "Darwin"
-- Stop auto comments
vim.opt.formatoptions:remove({ "c", "r", "o" })

-- Python
vim.g.lazyvim_python_lsp = "ty"
vim.g.lazyvim_python_ruff = "ruff"

-- Disable the option to require a Prettier config file
vim.g.lazyvim_prettier_needs_config = false

-- disable swapfile
vim.opt.swapfile = false
