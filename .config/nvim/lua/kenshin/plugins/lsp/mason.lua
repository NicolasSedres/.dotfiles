return {
  "williamboman/mason.nvim",           -- simple to use language server installer
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        border = "none",
        icons = {
          package_installed = "◍",
          package_pending = "◍",
          package_uninstalled = "◍",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "jsonls",
        "html",
        "emmet_ls",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
      },
      automatic_installation = true,
    })
  end,
}
