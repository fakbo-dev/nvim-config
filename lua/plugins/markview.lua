return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			restar_highlighter = true,
			code = {
				disable_background = false,
			},
			heading = {
				-- width = 'block'
			},
		})
	end,
}
