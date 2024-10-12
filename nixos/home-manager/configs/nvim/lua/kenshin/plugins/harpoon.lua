return {
	"ThePrimeagen/harpoon",
  keys = {
    {"<leader>m", ":lua require('harpoon.mark').add_file()<CR>"}
  },
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ph",
			":lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ noremap = true }
		)
	end,
}
