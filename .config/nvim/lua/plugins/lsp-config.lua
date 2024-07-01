return {
	{
		-- Mason installs and manages our LSPs
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- Mason LSP Config makes sure that certain LSPs are installed on our system
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		-- Nvim LSP Config hooks up Neovim to the LSP itself for communication
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Add more LSPs here for Neovim to know about them and communicate with them
			local lspconfig = require("lspconfig")

			-- PHP
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})
			-- lspconfig.phpactor.setup({
			-- 	capabilities = capabilities,
			-- })

			-- TypeScript/JavaScript
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			-- Ruby
			-- lspconfig.solargraph.setup({
			-- 	capabilities = capabilities,
			-- })

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Checkout more LSP functionalities using":h vim.lsp.buf"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})

			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
