return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	-- Nvim CMP --> Luasnip --> CMP Luasnip --> Friendly Snippets (The snippets themselves)
	{
		"L3MON4D3/LuaSnip",
		-- run = "make install_jsregexp",
		dependencies = {
			-- Completion Engine for Luasnip
			"saadparwaiz1/cmp_luasnip",
			-- The snippets themselves
			"rafamadriz/friendly-snippets",
			-- JSRegExp for LuaSnip transformations
			"b0o/mapx.nvim", -- Make sure to include jsregexp library
		},
	},
	{
		"hrsh7th/nvim-cmp",
		-- Set up nvim-cmp.
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- Snippet Engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
