return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- after = 'base16.lua',  -- Load after 'base16.lua'
  config = function()
    require("lualine").setup({
      options = {
        theme = "material",
        -- theme = "catppuccin",
        -- theme = 'base16'
        -- theme = 'dracula'
        -- theme = 'ayu_dark'
        -- theme = 'onedark'
        -- theme = 'molokai'
        -- theme = 'everforest'
      },
    })
  end,
}
