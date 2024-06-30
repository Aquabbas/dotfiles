return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "nvim-lua/plenary.nvim",
    },

    config = function()
        local alpha = require("alpha")
        -- local dashboard = require("alpha.themes.startify")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                                                ]],
            [[                                                                                ]],
            [[                                                                                ]],
            [[                                                                                ]],
            [[             █████╗  ██████╗ ██╗   ██╗ █████╗ ██╗   ██╗██╗███╗   ███╗           ]],
            [[            ██╔══██╗██╔═══██╗██║   ██║██╔══██╗██║   ██║██║████╗ ████║           ]],
            [[            ███████║██║   ██║██║   ██║███████║██║   ██║██║██╔████╔██║           ]],
            [[            ██╔══██║██║▄▄ ██║██║   ██║██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║           ]],
            [[            ██║  ██║╚██████╔╝╚██████╔╝██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║           ]],
            [[            ╚═╝  ╚═╝ ╚══▀▀═╝  ╚═════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝           ]],
            [[                                                                                ]],
            [[                                                                                ]],
            [[                                                                                ]],
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("<leader>f", "󰮗  > Find File", ":Telescope find_files<CR>"),
            dashboard.button("<leader>s", "󰱽  > Find Word", ":Telescope live_grep<CR>"),
            dashboard.button("<leader>r", "  > Recent Files", ":Telescope oldfiles<CR>"),
            -- dashboard.button("<leader>f", "  > Edit Files", ": Oil NeoVim Plugin "),

            -- dashboard.button("<C-c><C-f>", "󱏒  > Explore Files", ":Neotree filesystem toggle<CR>"),
            --
            dashboard.button("l", "  > Check Lazy", ":Lazy<CR>"),
            -- dashboard.button("UL", "󰚰  > Update Lazy", ":Lazy update<CR>"),
            --
            dashboard.button("m", "  > Check Mason", ":Mason<CR>"),
            -- dashboard.button("UM", "  > Update Mason", ":MasonUpdate<CR>"),

            -- dashboard.button("m", "󰍥  > Messages", ":messages<CR>"),
            -- dashboard.button("<leader>h", "󱍋  > Documentation", ":Telescope help_tags<CR>"),

            dashboard.button("q", "(╯°□°)╯︵ ┻━┻ > Quit", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end,
}
