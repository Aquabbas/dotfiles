return {
	"tpope/vim-commentary",
	config = function()
		-- Remove conflicting key mappings
		vim.api.nvim_del_keymap("n", "gcu")
		vim.api.nvim_del_keymap("n", "gcc")

		-- Ensure 'gc' and 'gcc' are correctly mapped
		vim.api.nvim_set_keymap("n", "gc", "<Plug>Commentary", {})
		vim.api.nvim_set_keymap("x", "gc", "<Plug>Commentary", {})
	end,
}
