return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
		"hiphish/rainbow-delimiters.nvim",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"java",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"sql",
				"json",
				"javascript",
				"typescript",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"dockerfile",
				"gitignore",
				"query",
				"clojure",
			},
			-- incremental_selection = {
			--   enable = true,
			--   keymaps = {
			--     init_selection = "<C-space>",
			--     node_incremental = "<C-space>",
			--     scope_incremental = false,
			--     node_decremental = "<bs>",
			--   },
			-- },
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
		local rainbow_delimiters = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow_delimiters.strategy["global"],
				vim = rainbow_delimiters.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			highlight = {
				"RainbowDelimiterRed",
				"RainbowDelimiterYellow",
				"RainbowDelimiterBlue",
				"RainbowDelimiterOrange",
				"RainbowDelimiterGreen",
				"RainbowDelimiterViolet",
				"RainbowDelimiterCyan",
			},
		}
	end,
}
