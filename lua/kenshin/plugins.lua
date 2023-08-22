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
   "rebelot/kanagawa.nvim",--theme

  -- cmp plugins
   "hrsh7th/nvim-cmp", -- The completion plugin
   "hrsh7th/cmp-buffer", -- buffer completions
   "hrsh7th/cmp-path", -- path completions
   "hrsh7th/cmp-cmdline", -- cmdline completions
   "saadparwaiz1/cmp_luasnip", -- snippet completions
   "hrsh7th/cmp-nvim-lsp",
   "hrsh7th/cmp-nvim-lua",

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
  --Debugger
   "mfussenegger/nvim-dap",
   "rcarriga/nvim-dap-ui",
   "theHamsta/nvim-dap-virtual-text",
   "rcarriga/cmp-dap",
  -- Telescope
   "nvim-telescope/telescope.nvim",
   "nvim-telescope/telescope-media-files.nvim",
  --treesitter
  "nvim-treesitter/nvim-treesitter",
   "p00f/nvim-ts-rainbow",
  -- Easily comment stuff
   {"numToStr/Comment.nvim",config = function()require("Comment").setup()end},
  --GitIntegration
   "tpope/vim-fugitive",
   "lewis6991/gitsigns.nvim",
  --file explorer
   "kevinhwang91/rnvimr",
   "kyazdani42/nvim-web-devicons",
   "moll/vim-bbye",
  -- tmux & split window navigation
  "christoomey/vim-tmux-navigator",
  "szw/vim-maximizer", -- maximizes and restores current window
  --STATUS-LINE-
   "nvim-lualine/lualine.nvim",
}

local opts = {}

require("lazy").setup(plugins, opts)
