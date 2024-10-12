return {
	"robitx/gp.nvim",
	config = function()
		local home_path = os.getenv("HOME")
		local conf = {
			-- For customization, refer to Install > Configuration in the Documentation/Readme
			providers = {
				gladis = {
					endpoint = "https://prod-global-openai-client.ist.nubank.world/v1/chat/completions",
					secret = {
						"bash",
						"-c",
						"cat " .. home_path .. "/dev/nu/.nu/tokens/ist/prod/access",
					},
				},
			},
			curl_params = {
				"--cert",
				home_path .. "/dev/nu/.nu/certificates/ist/prod/cert.pem",
				"--key",
				home_path .. "/dev/nu/.nu/certificates/ist/prod/key.pem",
			},

			log_sensitive = true,
			agents = {
				gladis = {
					name = "Nubank ChatGPT",
					provider = "gladis",
					chat = true,
					command = true,
					model = { model = "gpt-3.5-turbo" },
					system_prompt = require("gp.defaults").chat_system_prompt,
				},
			},
			hooks = {
				Explain = function(gp, params)
					local template =
						"Explain the following code:\n\nCode:\n```{{filetype}}\n{{selection}}\n```\n\nUse markdown format.\nHere's what the above code is doing:\n```"
					local agent = gp.get_chat_agent()
					gp.Prompt(params, gp.Target.popup, agent, template)
				end,
				Optimize = function(gp, params)
					local template =
						"Optimize the following code.\n\nCode:\n```{{filetype}}\n{{selection}}\n```\n\nOptimized version:\n```{{filetype}}"
					local agent = gp.get_chat_agent()
					gp.Prompt(params, gp.Target.popup, agent, template)
				end,
			},
		}
		require("gp").setup(conf)
		vim.api.nvim_set_keymap("n", "<leader>chg", ":GpChatNew<cr>", { silent = true, noremap = true })
		vim.api.nvim_set_keymap("v", "<leader>che", ":GpExplain<cr>", { silent = true, noremap = true })
		vim.api.nvim_set_keymap("v", "<leader>cho", ":GpOptimize<cr>", { silent = true, noremap = true })

		-- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
	end,
}
