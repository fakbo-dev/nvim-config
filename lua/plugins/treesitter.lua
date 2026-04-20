require("nvim-treesitter.install").prefer_git = false
require("nvim-treesitter.install").compilers = { "cl", "gcc", "cc", "zig" }
vim.treesitter.language.require_language = vim.treesitter.language.require_language or function() end

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"python",
		"javascript",
		"typescript",
		"markdown",
		"sql",
		"json",
		"yaml",
		"bash",
		"tsx",
		"css",
		"html",
		"rust",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
