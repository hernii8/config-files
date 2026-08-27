return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	branch = "regexp",
	event = "VimEnter",
	opts = {
		settings = {
			options = {
				notify_user_on_venv_activation = true,
			},
		},
	},
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "[V]env [S]elect" },
	},
}
