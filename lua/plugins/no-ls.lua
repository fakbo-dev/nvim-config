return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "clang-format" },
				typescript = { "clang-format" },
				javascriptreact = { "clang-format" },
				typescriptreact = { "clang-format" },
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
				sql = { "sql_formatter" },
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
