return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = function()
		require("git-conflict").setup({
			default_mappings = false,
		})
		vim.keymap.set("n", "<leader>gco", "<Plug>(git-conflict-ours)", { desc = "[G]it [C]onflict [O]urs" })
		vim.keymap.set("n", "<leader>gct", "<Plug>(git-conflict-theirs)", { desc = "[G]it [C]onflict [T]heirs" })
		vim.keymap.set("n", "<leader>gcb", "<Plug>(git-conflict-both)", { desc = "[G]it [C]onflict [B]oth" })
		vim.keymap.set("n", "<leader>gcx", "<Plug>(git-conflict-none)", { desc = "[G]it [C]onflict [N]one" })
		vim.keymap.set(
			"n",
			"<leader>gcp",
			"<Plug>(git-conflict-prev-conflict)",
			{ desc = "[G]it [C]onflict [P]revious" }
		)
		vim.keymap.set("n", "<leader>gcn", "<Plug>(git-conflict-next-conflict)", { desc = "[G]it [C]onflict [N]ext" })
		vim.keymap.set("n", "<leader>gcl", ":GitConflictListQf<CR>", { desc = "[G]it [C]onflict [L]ist" })
	end,
}
