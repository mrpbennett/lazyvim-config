-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })
vim.keymap.set("i", "jk", "<Esc>", { noremap = false })

-- Pressing 'aa' in normal mode will take you to the end of the line in insert mode
vim.keymap.set("n", "aa", "A", { noremap = false })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Pop a terminal window with K9s
if vim.fn.executable("k9s") == 1 then
  vim.keymap.set("n", "<leader>tk", function()
    Snacks.terminal("k9s")
  end, { desc = "K9s (Kubernetes)" })

  -- Add icon via which-key
  require("which-key").add({
    { "<leader>tk", icon = { icon = "󱃾", color = "blue" } },
  })
end

-- Pop a terminal window with LazyDocker
if vim.fn.executable("lazydocker") == 1 then
  vim.keymap.set("n", "<leader>td", function()
    Snacks.terminal("lazydocker")
  end, { desc = "LazyDocker" })
  -- Add icon via which-key
  require("which-key").add({
    { "<leader>td", icon = { icon = "󱃾", color = "blue" } },
  })
end

-- Pop a terminal window with Bucky
if vim.fn.executable("bucky") == 1 then
  vim.keymap.set("n", "<leader>tb", function()
    Snacks.terminal("bucky")
  end, { desc = "Bucky" })
  -- Add icon via which-key
  require("which-key").add({
    { "<leader>tb", icon = { icon = "󱐕", color = "orange" } },
  })
end

--
local gh_dash_cmd

if vim.fn.executable("gh-dash") == 1 then
  gh_dash_cmd = "gh-dash"
elseif vim.fn.executable("gh") == 1 then
  vim.fn.system({ "gh", "dash", "--help" })
  if vim.v.shell_error == 0 then
    gh_dash_cmd = "gh dash"
  end
end

-- Pop GH-Dash window
if gh_dash_cmd then
  vim.keymap.set("n", "<leader>tg", function()
    Snacks.terminal(gh_dash_cmd)
  end, { desc = "GH-Dash" })

  -- Add icon via which-key
  require("which-key").add({
    { "<leader>tg", icon = { icon = "", color = "orange" } },
  })
end
