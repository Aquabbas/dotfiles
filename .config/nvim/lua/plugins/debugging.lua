return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- PHP Debugger
		-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#PHP
		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { vim.fn.expand("~/.local/bin/debuggers/vscode-php-debug/out/phpDebug.js") },
		}
		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9003, -- Ensure this matches the port in your Xdebug configuration
			},
		}

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>ds", dap.set_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
		vim.keymap.set("n", "<Leader>do", dap.step_over, {})
		vim.keymap.set("n", "<Leader>di", dap.step_into, {})
		vim.keymap.set("n", "<Leader>du", dap.step_out, {})

		-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
		-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
	end,
}
