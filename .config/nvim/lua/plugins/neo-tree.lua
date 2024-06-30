return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-c><C-f>", ":Neotree filesystem toggle<CR>", {})

		-- vim.keymap.set('n', '<C-Right>', ':NeoTreeResize +5<CR>', {})
		-- vim.keymap.set('n', '<C-Left>', ':NeoTreeResize -5<CR>', {})
	end,
}
