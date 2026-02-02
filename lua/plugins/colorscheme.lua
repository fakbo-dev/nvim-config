return {
	"https://gitlab.com/motaz-shokry/gruvbox.nvim",
	name = "gruvbox",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			styles = {
				transparency = true,
			},
		})
		vim.cmd("colorscheme gruvbox")
	end,
}
