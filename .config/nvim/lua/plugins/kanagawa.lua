return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000, -- Adjust priority as needed
		name = "kanagawa",
		config = function()
			require("kanagawa").setup()
			vim.cmd("colorscheme kanagawa-wave")
		end,
	},
}
