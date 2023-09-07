local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	------------------- SamuPlugins----------------------------------------------------
	"rebelot/kanagawa.nvim", --theme
	--Fachering notification
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
  --auto close brackets
  "windwp/nvim-autopairs",
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
	--Debugger
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/cmp-dap",
	"nvim-telescope/telescope-dap.nvim",
	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	--treesitter
	"nvim-treesitter/nvim-treesitter",
	"p00f/nvim-ts-rainbow",
	-- Easily comment stuff
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	--GitIntegration
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
  --DatabaseIntegration
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",
   {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("kenshin.dadbod").setup()
    end,
  },
	--file explorer
	"kyazdani42/nvim-web-devicons",
	"moll/vim-bbye",
	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",
	"szw/vim-maximizer", -- maximizes and restores current window
	--STATUS-LINE-
	"nvim-lualine/lualine.nvim",
  --COLORPICKER
  "KabbAmine/vCoolor.vim"
}

local opts = {}

require("lazy").setup(plugins, opts)
