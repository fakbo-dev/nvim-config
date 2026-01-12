return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				java = { "clang-format" },
				json = { "clang-format" },
				html = { "prettier" },
				css = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				terraform = { "terraform_fmt" },
				python = { "ruff_format", "ruff_organize_imports" },
				lua = { "stylua" },
				sql = { "sqlfmt" },
			},

			formatters = {
				["clang-format"] = {
					prepend_args = { "--style={BasedOnStyle: LLVM, BreakBeforeBraces: Allman}" },
				},
				shfmt = {
					prepend_args = { "-i", "4" },
				},
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
