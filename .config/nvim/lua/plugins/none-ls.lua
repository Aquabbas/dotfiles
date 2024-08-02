return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- ---------------------------------------------
                -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
                -- ---------------------------------------------

                -- SQL
                null_ls.builtins.diagnostics.sqlfluff.with({
                    extra_args = { "--dialect", "postgres", "mysql", "sqlite" }, -- change to your dialect
                }),
                null_ls.builtins.formatting.sqlfluff.with({
                    extra_args = { "--dialect", "postgres", "mysql", "sqlite" }, -- change to your dialect
                }),

                -- Rust
                null_ls.builtins.formatting.dxfmt,

                -- C/C++
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cppcheck,

                -- Lua
                null_ls.builtins.formatting.stylua,

                -- PHP
                null_ls.builtins.diagnostics.phpcs.with({}),
                null_ls.builtins.formatting.phpcbf.with({}),

                -- General Frontend Formatter
                null_ls.builtins.formatting.prettier,
                -- TypeScript/JavaScript
                require("none-ls.diagnostics.eslint_d"),

                -- Tailwind CSS
                null_ls.builtins.formatting.rustywind,

                -- CSS
                null_ls.builtins.formatting.stylelint,
                null_ls.builtins.diagnostics.stylelint,

                -- html
                null_ls.builtins.diagnostics.markuplint,

                -- Bash
                null_ls.builtins.formatting.shfmt,

                -- Zsh
                null_ls.builtins.diagnostics.zsh,

                -- ---------------------------------------------
                -- EXTRAS
                -- ---------------------------------------------

                -- Markdown
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.formatting.markdownlint,

                -- git commit (Conventional Commits)
                null_ls.builtins.diagnostics.commitlint,

                -- .env files
                -- https://dotenv-linter.github.io/#/installation?id=cargo
                null_ls.builtins.diagnostics.dotenv_linter,

                -- Spelling
                null_ls.builtins.formatting.codespell,
                null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.completion.spell,

                -- Git Integration
                null_ls.builtins.code_actions.gitsigns,

                -- Docker
                null_ls.builtins.diagnostics.hadolint,

                -- Markdown
                null_ls.builtins.hover.dictionary,

                -- Shell
                null_ls.builtins.hover.printenv,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
