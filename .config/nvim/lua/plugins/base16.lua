return {
  "RRethy/base16-nvim",
  -- after = 'lazy.nvim',  -- Load after 'packer.nvim'
  config = function()
    vim.cmd('colorscheme base16-catppuccin-mocha')
  end
}
