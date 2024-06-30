return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,

        null_ls.builtins.diagnostics.phpcs.with({
          -- command = "/usr/local/bin/phpcs", -- Adjust path if necessary
          -- debounce = 100,
          -- args = {
          --   "--standard=/home/abbashayder/.config/phpcs/phpcs.xml", -- Adjust path to your phpcs.xml
          --   "--encoding=utf-8",
          --   "--runtime-set",
          --   "ignore_errors_on_exit",
          --   "1", -- Optional: Ignore errors on exit
          -- },
          -- stdin = true,
        }),
        -- null_ls.builtins.diagnostics.phpstan.with({}),
        -- null_ls.builtins.formatting.phpcsfixer.with({}),
        null_ls.builtins.formatting.phpcbf.with({
          -- command = "/usr/local/bin/phpcbf", -- Adjust path if necessary
          -- stdin = true,
        }),
        -- null_ls.builtins.diagnostics.phpmd.with({}),

        require("none-ls.diagnostics.eslint_d"),
        -- require("none-ls.diagnostics.phpcs"),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
