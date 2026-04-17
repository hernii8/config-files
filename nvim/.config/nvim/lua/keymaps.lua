-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>-", "<C-^>", { desc = "Go to previous file" })
vim.keymap.set("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "[E]rror [Q]uickfix list" })
vim.keymap.set("n", "<leader>ed", vim.diagnostic.open_float, { desc = "[E]rror [D]etail" })

-- Disable "s" key for s
vim.keymap.set("n", "s", "<Nop>", { noremap = false, silent = true })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center screen after moving by half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center screen after moving by half page up" })

-- Reload config
vim.keymap.set("n", "<leader>rc", function()
	for name, _ in pairs(package.loaded) do
		if name:match("^cnull") then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
end, { desc = "[R]eload [C]onfiguration" })
