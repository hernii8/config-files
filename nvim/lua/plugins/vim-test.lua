return {
	"vim-test/vim-test",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	dependencies = {
		"preservim/vimux",
	},
	cmd = {
		"TestNearest",
		"TestFile",
		"TestSuite",
		"TestLast",
		"TestVisit",
	},
	config = function()
		vim.cmd("let test#strategy = 'vimux'")
		vim.keymap.set("n", "<leader>tn", "<cmd>:TestNearest<cr>", { desc = "[T]est [N]earest" })
		vim.keymap.set("n", "<leader>tf", "<cmd>:TestFile<cr>", { desc = "[T]est [F]ile" })
		vim.keymap.set("n", "<leader>ts", "<cmd>:TestSuite<cr>", { desc = "[T]est [S]uite" })
		vim.keymap.set("n", "<leader>tl", "<cmd>:TestLast<cr>", { desc = "[T]est [L]ast" })
		vim.keymap.set("n", "<leader>tv", "<cmd>:TestVisit<cr>", { desc = "[T]est [V]isit" })
	end,
}
