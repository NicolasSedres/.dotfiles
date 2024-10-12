return {
	"Olical/conjure",
	ft = { "clojure", "fennel", "python" }, -- etc
	-- [Optional] cmp-conjure for cmp
	dependencies = {
		{
			"PaterJason/cmp-conjure",
			config = function()
				local cmp = require("cmp")
				local config = cmp.get_config()
				table.insert(config.sources, {
					name = "buffer",
					option = {
						sources = {
							{ name = "conjure" },
						},
					},
				})
				cmp.setup(config)
			end,
		},
		{
			"m00qek/baleia.nvim",
			version = "*",
			config = function()
				vim.g.conjure_baleia = require("baleia").setup({ line_starts_at = 3 })

				local augroup = vim.api.nvim_create_augroup("ConjureBaleia", { clear = true })

				vim.api.nvim_create_autocmd({ "BufEnter" }, {
					pattern = "conjure-log-*",
					group = augroup,
					callback = function()
						vim.keymap.set({ "n", "v" }, "[c", "<CMD>call search('^; -\\+$', 'bw')<CR>", {
							silent = true,
							buffer = true,
							desc = "Jumps to the begining of previous evaluation output.",
						})
						vim.keymap.set(
							{ "n", "v" },
							"]c",
							"<CMD>call search('^; -\\+$', 'w')<CR>",
							{ silent = true, buffer = true, desc = "Jumps to the begining of next evaluation output." }
						)
					end,
				})

				vim.api.nvim_create_user_command("BaleiaColorize", function()
					vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
				end, { bang = true })

				vim.api.nvim_create_user_command("BaleiaLogs", vim.g.conjure_baleia.logger.show, { bang = true })
			end,
		},
	},
	config = function(_, opts)
		require("conjure.main").main()
		require("conjure.mapping")["on-filetype"]()
		vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
		vim.g["conjure#client#clojure#nrepl#test#current_form_names"] =
			{ "deftest", "defflow", "defflow-i18n", "defspec", "facts", "defflow-no-started-system" }
		vim.api.nvim_set_keymap("n", "<leader>et", ":ConjureCljRunCurrentTest<cr>", { silent = true, noremap = true })
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ebt",
			":ConjureCljRunCurrentNsTests<cr>",
			{ silent = true, noremap = true }
		)
		vim.api.nvim_set_keymap("n", "<leader>ept", ":ConjureCljRunAllTests<cr>", { silent = true, noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>rl", ":ConjureCljRefreshChanged<cr>", { silent = true, noremap = true })
		vim.api.nvim_set_keymap("n", "<leader>rel", ":ConjureCljRefreshAll<cr>", { silent = true, noremap = true })
	end,
	init = function()
		-- print color codes if baleia.nvim is available
		vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"] = 1
		-- disable diagnostics in log buffer and colorize it
		vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
			pattern = "conjure-log-*",
			callback = function()
				local buffer = vim.api.nvim_get_current_buf()
				vim.diagnostic.disable(buffer)

				if vim.g.conjure_baleia then
					vim.g.conjure_baleia.automatically(buffer)
				end
			end,
		})
		-- Set configuration options here
		-- vim.g["conjure#debug"] = true
	end,
}
