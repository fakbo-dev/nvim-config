return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
	opts = {},
	config = function()
		require("render-markdown").setup({
			restar_highlighter = false,
			code = {
				disable_background = false,
			},
			heading = {},
		})
	end,
}
