return {
	{
		-- Mason installs and manages our LSPs
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				PATH = "prepend",
				-- Use pnpm on Linux/Unix, npm on Windows
				pip = {
					upgrade_pip = true,
				},
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- Ensure certain tools are installed
			if vim.fn.has("unix") == 1 then
				local mr = require("mason-registry")
				for _, tool in ipairs({
					"lua-language-server", -- For Lua
					"intelephense", -- For PHP
					"typescript-language-server", -- For TypeScript/JavaScript
					"html-lsp", -- For HTML
					"clangd", -- For C++
					"astro-language-server", -- For Astro
					"bash-language-server", -- For Bash/Zsh
				}) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
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

			-- Bash/Zsh
			lspconfig.bashls.setup({
				allowlist = {
					-- Add zsh file extensions here
					{ "zsh" },
				},
			})

			-- Astro Framework LSP
			lspconfig.astro.setup({
				capabilities = capabilities,
			})

			-- PHP
			lspconfig.intelephense.setup({
				capabilities = capabilities,
			})

			-- TypeScript/JavaScript
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

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

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "zsh",
				command = "setlocal filetype=sh",
			})
		end,
	},
}
