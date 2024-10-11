return {
	"williamboman/mason.nvim", -- simple to use language server installer
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- simple to use language server installer
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				border = "none",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"jsonls",
				"html",
				"emmet_ls",
				"ts_ls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"clojure_lsp",
				"clangd",
			},
			automatic_installation = true,
		})
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"clj-kondo", --clojure linter
				"beautysh",
			},
		})
	end,
}
