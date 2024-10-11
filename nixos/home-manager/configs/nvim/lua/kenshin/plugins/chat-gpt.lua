return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local home_path = os.getenv("HOME")
		require("chatgpt").setup({
			api_host_cmd = "echo -n https://prod-global-openai-client.ist.nubank.world",
			api_key_cmd = "cat " .. home_path .. "/dev/nu/.nu/tokens/ist/prod/access",
			extra_curl_params = {
				"--cert",
				home_path .. "/dev/nu/.nu/certificates/ist/prod/cert.pem",
				"--key",
				home_path .. "/dev/nu/.nu/certificates/ist/prod/key.pem",
			},
		})
		vim.api.nvim_set_keymap(
			"v",
			"<leader>chu",
			":ChatGPTEditWithInstructions<cr>",
			{ silent = true, noremap = true }
		)
	end,
}
