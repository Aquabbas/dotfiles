return {
	"ggandor/leap.nvim",
	dependencies = { "tpope/vim-repeat" },
	priority = 1000, -- Load with high priority
	lazy = false, -- Load eagerly on startup
	config = function()
		-- Set up Leap plugin
		require("leap").setup({
			highlight_unlabeled_phase_one_targets = true,
		})

		-- Create default mappings
		require("leap").add_default_mappings({})

		-- Set highlighting for Leap elements
		vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
		vim.api.nvim_set_hl(0, "LeapMatch", {
			-- For light themes, set to 'black' or similar.
			fg = "white",
			bold = true,
			nocombine = true,
		})

		-- Deprecated option. Try it without this setting first, you might find
		-- you don't even miss it.
		require("leap").opts.highlight_unlabeled_phase_one_targets = true

		vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
			fg = "red",
			bold = true,
			nocombine = true,
		})

		vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
			fg = "blue",
			bold = true,
			nocombine = true,
		})
	end,
}
