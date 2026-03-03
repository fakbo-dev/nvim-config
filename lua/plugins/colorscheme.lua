return {
	"https://gitlab.com/motaz-shokry/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			styles = {
				transparency = true,
				bold = false,
				italic = false,
			},
			highlight_groups = {
				Comment = { inherit = false, fg = "gray" },
				StatusLine = { inherit = false },
				Visual = { fg = "bg_second", bg = "fg1", inherit = false },
			},

			before_highlight = function(group, highlight, palette)
				if highlight.undercurl then
					highlight.undercurl = false
				end
			end,
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
