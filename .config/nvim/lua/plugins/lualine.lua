return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- after = 'base16.lua',  -- Load after 'base16.lua'
	config = function()
		require("lualine").setup({
			options = {
				theme = "ayu_dark",
				-- theme = "kanagawa",
				-- theme = "material",
				-- theme = "catppuccin",
				-- theme = 'base16'
				-- theme = 'dracula'
				-- theme = 'onedark'
				-- theme = 'molokai'
				-- theme = 'everforest'
			},
		})
	end,
}
