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
					"astro-language-server", -- Astro Framework
					"angular-language-server", -- Angular
					"sqlls", -- SQL
					"rust-analyzer", -- Rust
					"clangd", -- C++
					"lua-language-server", -- Lua
					"intelephense", -- PHP
					"typescript-language-server", -- TypeScript/JavaScript
					"eslint-lsp",
					"tailwindcss-language-server", -- Tailwind CSS
					"css-variables-language-server", -- CSS
					"html-lsp", -- html
					"marksman", -- Markdown
					"bash-language-server", -- Bash/Zsh
					"dot-language-server", -- .env
					"dockerfile-language-server", -- Docker
					"docker-compose-language-service",
					"textlsp", -- Spelling
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
			-- ---------------------------------------------
			-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
			-- ---------------------------------------------

			-- Frameworks
			lspconfig.astro.setup({
				capabilities = capabilities,
			})
			lspconfig.angularls.setup({
				capabilities = capabilities,
			})

			-- ---------------------------------------------

			-- SQL
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})

			-- Rust
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			-- C/C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Lua
			lspconfig.lua_ls.setup({
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
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})

			-- Tailwind CSS
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			-- CSS
			lspconfig.css_variables.setup({
				capabilities = capabilities,
			})

			-- html
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- Markdown
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})

			-- Bash/Zsh
			lspconfig.bashls.setup({
				allowlist = {
					{ "zsh" },
				},
			})
			-- Configure Neovim to use bash-language-server for zsh files
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "zsh",
				command = "setlocal filetype=sh",
			})

			-- .env
			lspconfig.dotls.setup({
				capabilities = capabilities,
			})

			-- Docker
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})

			-- Spelling
			lspconfig.textlsp.setup({
				capabilities = capabilities,
			})

            -- A plain text note-taking assistant
			lspconfig.zk.setup({
				capabilities = capabilities,
			})

			-- ---------------------------------------------

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
