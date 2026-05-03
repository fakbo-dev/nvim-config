return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"igorlfs/nvim-dap-view",
			opts = {
				windows = {
					position = "below",
					size = 0.35, -- 35% del ancho total
				},
			},
		},
	},
	config = function()
		local dap = require("dap")
		local dapview = require("dap-view")

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "127.0.0.1",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port}",
					"127.0.0.1",
				},
			},
		}

		for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch current file",
					program = "${file}",
					cwd = "${workspaceFolder}",
					sourceMaps = true,
					skipFiles = { "<node_internals>/**", "**/node_modules/**" },
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to process",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
					sourceMaps = true,
				},
			}
		end

		dap.listeners.after.event_initialized["dapview_config"] = function()
			dapview.open()
		end
		dap.listeners.before.event_terminated["dapview_config"] = function()
			dapview.close()
		end
		dap.listeners.before.event_exited["dapview_config"] = function()
			dapview.close()
		end

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP continue" })
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP breakpoint" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP step over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP step into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP step out" })
		vim.keymap.set("n", "<leader>dv", dapview.toggle, { desc = "DAP view toggle" })
		vim.keymap.set("n", "<leader>dw", "<cmd>DapViewWatch<cr>", { desc = "DAP watch expression" })
		vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP REPL" })
	end,
}
