return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	branch = "0.1.x",
	keys = {
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "[S]earch [K]eymaps" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles" },
		{ "<leader>ss", "<cmd>Telescope builtin<cr>", desc = "[S]earch [S]elect Telescope" },
		{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord" },
		{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics" },
		{ "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>cc", "<cmd>Telescope git_files<cr>", desc = "Git files" },
		{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "See todos" },
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
				)
			end,
			desc = "[/] Fuzzy search in buffer",
		},
		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			desc = "[S]earch [/] in Open Files",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-l>"] = actions.select_default,
						["<C-p>"] = require("telescope.actions.layout").toggle_preview,
					},
				},
				preview = { hide_on_startup = true },
			},
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
