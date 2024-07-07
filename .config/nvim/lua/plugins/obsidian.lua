return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false, -- Set to false to load the plugin on startup
    -- ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local vault_path = ""

        -- Detect OS
        local os_name = jit.os
        if os_name == "osx" then
            vault_path = "~/Obsidian/Notes"
        elseif os_name == "linux" then
            vault_path = "~/Obsidian/Notes"
        else
            vault_path = "/mnt/c/Users/AbbasHayder/Obsidian/Notes"
        end

        require("obsidian").setup({
            workspaces = {
                {
                    name = "Notes",
                    path = vault_path,
                },
            },
            -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
            completion = {
                -- Set to false to disable completion.
                nvim_cmp = true,
                -- Trigger completion at 2 chars.
                min_chars = 2,
            },
            -- Obsidian Keymaps
            vim.keymap.set(
                "n",
                "<leader>oc",
                "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
                { desc = "Obsidian Check Checkbox" }
            ),
            vim.keymap.set("n", "<leader>om", "i[]()<Esc>hhi", { desc = "Insert markdown link format" }),

            vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" }),
            vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open in Obsidian App" }),
            vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" }),
            vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" }),
            vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" }),
            vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" }),
            vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" }),
        })
    end,
}
