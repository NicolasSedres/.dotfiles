return {
	"smoka7/hop.nvim",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	opts = {
    vim.api.nvim_set_keymap("n", "s", ":HopAnywhere<cr>", { silent = true });
    vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true });
  },
}
