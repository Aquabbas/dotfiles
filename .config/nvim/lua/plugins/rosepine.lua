return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		name = "Terafox Theme",
		config = function()
			require("nightfox").load({
				variant = "terafox",
			})
			vim.cmd("colorscheme nightfox")
		end,
	},
}
