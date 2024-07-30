return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- For more Linter/Formatter Setups
                -- Go to: https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

                -- Bash/Zsh
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.diagnostics.zsh,

                -- null_ls.builtins.formatting.beautysh.with({
                -- }),

                -- null_ls.builtins.diagnostics.shellcheck.with({
                -- }),

                -- null_ls.builtins.formatting.beautysh,
                -- null_ls.builtins.diagnostics.shellcheck,

                -- Lua
                null_ls.builtins.formatting.stylua,

                -- General Frontend Formatter
                null_ls.builtins.formatting.prettier,
                --
                -- TypeScript/JavaScript
                require("none-ls.diagnostics.eslint_d"),

                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                -- Ruby
                null_ls.builtins.diagnostics.erb_lint,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.rubocop,

                -- PHP
                null_ls.builtins.diagnostics.phpcs.with({}),
                null_ls.builtins.formatting.phpcbf.with({}),

                -- Markdown
                -- null_ls.builtins.diagnostics.markdownlint_cli2,
                -- null_ls.builtins.diagnostics.markdownlint_cli2,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.markdownlint,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
