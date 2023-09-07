return {
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	------------------- SamuPlugins----------------------------------------------------
	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions
	-- LSP FOR JAVA
	"mfussenegger/nvim-jdtls",
	--codeCoverage for jacoco
	"dsych/blanket.nvim",
	-- Easily comment stuff
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	--file explorer
	"kyazdani42/nvim-web-devicons",
	"moll/vim-bbye",
	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer", -- maximizes and restores current window
	--COLORPICKER
	"KabbAmine/vCoolor.vim",
}
