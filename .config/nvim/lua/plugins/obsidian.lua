return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false, -- Set to false to load the plugin on startup
	-- ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local vault_path = ""

		-- Detect if running within WSL or Windows
		local is_windows = os.getenv("WSL_DISTRO_NAME") or vim.fn.has("win32") == 1

		-- Set vault path based on OS
		if is_windows then
			vault_path = "/mnt/c/Users/AbbasHayder/Obsidian/Notes"
		else
			vault_path = "~/Obsidian/Notes"
		end

		require("obsidian").setup({
			-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
			-- URL it will be ignored but you can customize this behavior here.
			---@param url string
			follow_url_func = function(url)
				-- Open the URL in the default web browser based on OS.
				if is_windows then
					vim.fn.jobstart({ "powershell.exe", "-Command", "Start-Process", url })
				elseif vim.fn.has("mac") == 1 then
					vim.fn.jobstart({ "open", url })
				else
					vim.fn.jobstart({ "xdg-open", url })
				end
			end,

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
