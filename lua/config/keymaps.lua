-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })
vim.keymap.set("i", "jk", "<Esc>", { noremap = false })

-- Pressing 'aa' in normal mode will take you to the end of the line in insert mode
vim.keymap.set("n", "aa", "A", { noremap = false })

-- Move current line or selected block down/up in normal and visual modes
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down (insert mode)" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up (insert mode)" })

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

-- -- Pop Posting terminal
-- if vim.fn.executable("posting") == 1 then
--   vim.keymap.set("n", "<leader>ta", function()
--     Snacks.terminal("posting")
--   end, { desc = "Posting API" })
--
--   -- Add icon via which-key
--   require("which-key").add({
--     { "<leader>ta", icon = { icon = "󱂛", color = "orange" } },
--   })
-- end
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
