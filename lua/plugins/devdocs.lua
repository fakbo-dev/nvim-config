return {
	"maskudo/devdocs.nvim",
	lazy = false,
	dependencies = {
		"folke/snacks.nvim",
	},
	cmd = { "DevDocs" },
	keys = {
		{
			"<leader>ho",
			mode = "n",
			"<cmd>DevDocs get<cr>",
			desc = "Get Devdocs",
		},
		{
			"<leader>hi",
			mode = "n",
			"<cmd>DevDocs install<cr>",
			desc = "Install Devdocs",
		},
		{
			"<leader>hv",
			mode = "n",
			function()
				local devdocs = require("devdocs")

				local function open_glow_float(path)
					local buf = vim.api.nvim_create_buf(false, true)
					local width = math.floor(vim.o.columns * 0.8)
					local height = math.floor(vim.o.lines * 0.8)
					vim.api.nvim_open_win(buf, true, {
						relative = "editor",
						width = width,
						height = height,
						row = math.floor((vim.o.lines - height) / 2),
						col = math.floor((vim.o.columns - width) / 2),
						border = "rounded",
						style = "minimal",
					})
					vim.fn.jobstart({ "glow", "-s", "dark", "-w", tostring(width - 4), path }, { term = true })
					vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, silent = true })
				end

				vim.ui.select(devdocs.GetInstalledDocs(), { prompt = "DevDocs" }, function(selected)
					if not selected then
						return
					end
					local docDir = devdocs.GetDocDir(selected)
					require("telescope.builtin").find_files({
						cwd = docDir,
						prompt_title = "DevDocs: " .. selected,
						attach_mappings = function(prompt_bufnr)
							local actions = require("telescope.actions")
							local state = require("telescope.actions.state")
							actions.select_default:replace(function()
								local entry = state.get_selected_entry()
								actions.close(prompt_bufnr)
								if entry then
									open_glow_float(entry.path or vim.fs.joinpath(docDir, entry[1]))
								end
							end)
							return true
						end,
					})
				end)
			end,
			desc = "View installed Devdocs",
		},
		{
			"<leader>hd",
			mode = "n",
			"<cmd>DevDocs delete<cr>",
			desc = "Delete Devdoc",
		},
	},
	opts = {
		ensure_installed = {
			-- "javascript",
			-- "typescript",
			-- "node",
		},

		-- Floating documentation window
		float_win = {
			relative = "editor",
			height = math.floor(vim.o.lines * 0.8),
			width = math.floor(vim.o.columns * 0.8),
			border = "rounded",
			style = "minimal",
		},

		wrap = true,

		-- Render Markdown with Glow
		previewer_cmd = "glow",
		cmd_args = { "-s", "dark", "-w", "100" },

		-- Optional: also use Glow in the picker preview
		picker_cmd = true,
		picker_cmd_args = { "-s", "dark", "-w", "80" },

		after_open = function(bufnr)
			vim.keymap.set("n", "q", "<cmd>close<cr>", {
				buffer = bufnr,
				silent = true,
				desc = "Close DevDocs",
			})
		end,
	},
}
