-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>-", "<C-^>")
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "[E]rror [Q]uickfix list" })
vim.keymap.set("n", "<leader>ed", vim.diagnostic.open_float, { desc = "[E]rror [D]etail" })
-- Disable "s" key for s
vim.keymap.set("n", "s", "<Nop>", { noremap = false, silent = true })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center screen after moving by half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center screen after moving by half page up" })
