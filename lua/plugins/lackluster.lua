return {
	-- testing
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,

	config = function()
		require("lackluster").setup({
			tweak_background = {
				normal = "none",
				telescope = "none",
			},
			tweak_syntax = {
				string = "#988069",
				comment = "#999DA0",
			},
			disable_plugin = {
				bufferline = false,
				cmp = false,
				dashboard = false,
				flash = false,
				git_gutter = false,
				git_signs = false,
				headline = false,
				indentmini = false,
				lazy = false,
				lightbulb = false,
				lsp_config = false,
				mason = false,
				mini_diff = false,
				navic = false,
				noice = false,
				notify = false,
				oil = false,
				rainbow_delimiter = false,
				scollbar = false,
				telescope = false,
				todo_comments = true,
				tree = false,
				trouble = false,
				which_key = false,
				yanky = true,
			},
		})
		-- vim.cmd.colorscheme("lackluster-hack")
	end,
}
