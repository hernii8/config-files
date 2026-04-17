return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		animate = { enabled = false },
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = " ", key = "g", desc = "Browse Files", action = ":lua Snacks.explorer()" },
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "startup" },
				{ pane = 2, section = "keys", gap = 1, padding = 1 },
			},
		},
		dim = { enabled = false },
		debug = { enabled = false },
		explorer = {
			enabled = true,
		},
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
					layout = {
						preset = "dropdown",
					},
					matcher = {
						fuzzy = true,
						smartcase = true,
						ignorecase = true,
						filename_bonus = true,
						cwd_bonus = true,
						frecency = false,
						history_bonus = false,
					},
					sort = { fields = { "score:desc" } },
					ui_select = true,
					show_empty = true,
				},
				git_branches = {
					layout = {
						preset = "vscode",
					},
				},
				commands = {
					layout = {
						preset = "vscode",
					},
				},
				command_history = {
					layout = {
						preset = "vscode",
					},
				},
				colorschemes = {
					layout = {
						preset = "vscode",
					},
				},
				smart = {
					layout = {
						preset = "right",
					},
				},
				buffers = {
					layout = {
						preset = "right",
					},
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {},
		zen = {
			enabled = false,
		},
	},
	keys = {
		-- Find
		{
			"<leader>ff",
			function()
				Snacks.picker.smart()
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fo",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[F]ind [O]pen Buffers",
		},
		{
			"<leader>f:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "[F]ind Command[:] History",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.commands()
			end,
			desc = "[F]ind [C]ommand",
		},
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "[F]ind [N]otification",
		},
		{
			"<leader>fb",
			function()
				Snacks.explorer()
			end,
			desc = "[F]ind Files [B]rowsing",
		},
		{
			"<leader>fC",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[F]ind [C]onfig Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "[F]ind [P]rojects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "[F]ind [R]ecent",
		},
		{
			'<leader>f"',
			function()
				Snacks.picker.registers()
			end,
			desc = '[F]ind ["]Registers',
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "[F]ind [A]utocommands",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[F]ind [D]iagnostics",
		},
		{
			"<leader>fD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "[F]ind Buffer [D]iagnostics",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "[F]ind [H]elp",
		},
		{
			"<leader>fH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "[F]ind [H]ighlights",
		},
		{
			"<leader>fi",
			function()
				Snacks.picker.icons()
			end,
			desc = "[F]ind [I]cons",
		},
		{
			"<leader>fj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "[F]ind [J]umps",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[F]ind [K]eymaps",
		},
		{
			"<leader>fm",
			function()
				Snacks.picker.marks()
			end,
			desc = "[F]ind [M]arks",
		},
		{
			"<leader>fM",
			function()
				Snacks.picker.man()
			end,
			desc = "[F]ind [M]an Pages",
		},
		{
			"<leader>fP",
			function()
				Snacks.picker.lazy()
			end,
			desc = "[F]ind [P]lugins",
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "[F]ind in [Q]uickfix List",
		},
		{
			"<leader>fR",
			function()
				Snacks.picker.resume()
			end,
			desc = "[F]ind [R]esume",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "[F]ind [U]ndo History",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "[F]ind [S]ymbols",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "[F]ind [W]orkspace Symbols",
		},
		{
			"<leader>fv",
			function()
				Snacks.picker.cliphist()
			end,
			desc = "[F]ind Clipboard History",
		},
		-- git
		{
			"<leader>gf",
			function()
				Snacks.picker.git_files()
			end,
			desc = "[G]it [F]iles",
		},
		{
			"<leader>gB",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "[G]it [B]ranches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "[G]it [L]og",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "[G]it [B]lame",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "[G]it [S]tatus",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "[G]it [S]tash",
		},
		{
			"<leader>go",
			function()
				Snacks.gitbrowse()
			end,
			desc = "[G]it [O]pen file in browser",
			mode = { "n", "v" },
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "[G]it [D]iff",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "[G]it Log [F]ile",
		},
		-- Grep
		{
			"<leader>sc",
			function()
				Snacks.picker.lines()
			end,
			desc = "[S]earch [C]urrent File",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "[S]earch Open [B]uffers",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.grep()
			end,
			desc = "[S]earch in [F]iles",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[S]earch [W]ord",
			mode = { "n", "x" },
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "[G]oto [D]efinition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "[G]oto [D]efinition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "[G]oto [R]eferences",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "[G]oto [I]mplementation",
		},
		{
			"gt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "[G]oto [T]ype Definition",
		},
		{
			"<leader>nc",
			function()
				Snacks.scratch()
			end,
			desc = "[N]ote [C]reate",
		},
		{
			"<leader>nb",
			function()
				Snacks.scratch.select()
			end,
			desc = "[N]ote [B]uffer",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "[L]azy [G]it",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "[B]uffer [D]elete",
		},
		{
			"<leader>rf",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "[R]ename [F]ile",
		},
		{
			"<leader>uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "[U]I [C]olorscheme",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Create some toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
