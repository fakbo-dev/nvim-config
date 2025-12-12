return {
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"tpope/vim-rhubarb",
		dependencies = { "tpope/vim-fugitive" },
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = true,
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			colors = {
				error = { "#DC2626" },
				warning = { "#FBBF24" },
				WARN = { "#FFA500" },
				info = { "#2563EB" },
				hint = { "#10B981" },
				default = { "#7C3AED" },
				test = { "#FF00FF" },
			},
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"ecthelionvi/NeoColumn.nvim",
		opts = { always_on = true, bg_color = "#141414", fg_color = "#ffffff" },
	},
	{
		"tronikelis/ts-autotag.nvim",
		opts = {},
		event = "VeryLazy",
	},
	{
		"luckasRanarison/nvim-devdocs",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
	{
		"nendix/zen.nvim",
		lazy = false,
		priority = 1000,

		config = function()
			require("zen").setup({
				variant = "dark",
				undercurl = true,
				transparent = true,
				dimInactive = false,
				terminalColors = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = {},
				typeStyle = {},
				compile = false,
				colors = {
					palette = {}, -- override palette colors
					theme = {}, -- override theme colors
				},
				overrides = function(colors)
					return {}
				end,
			})

			-- vim.cmd.colorscheme("zen")
		end,
	},
}
