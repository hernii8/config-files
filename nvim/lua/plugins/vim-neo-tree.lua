return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				hijack_netrw_behavior = "open_current",
			},
		})
		vim.keymap.set("n", "<leader>bf", function()
			require("neo-tree.command").execute({
				source = "filesystem",
				position = "float",
				toggle = true,
			})
		end, { desc = "[B]rowse [F]iles" })
		vim.keymap.set("n", "<leader>bc", function()
			require("neo-tree.command").execute({
				reveal_force_cwd = true,
				position = "float",
				toggle = true,
			})
		end, { desc = "[B]rowse [C]urrent" })
	end,
}
