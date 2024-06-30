return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    -- Ensure that the parsers for the following languages are installed in TreeSitter
    configs.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
