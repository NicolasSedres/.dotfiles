local jdtls = require("jdtls")
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "/home/kenshin/.cache/eclipse/" .. project_name
-- Helper function for creating keymaps
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
  opts.buffer = bufnr
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap.set("n", "<leader>gl", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
  keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
  -------------------Java extensions provided by jdtls--------------------------
  keymap.set("n", "<C-o>", jdtls.organize_imports, opts)
  keymap.set("n", "<space>ev", jdtls.extract_variable, opts)
  keymap.set("n", "<space>ec", jdtls.extract_constant, opts)
  keymap.set("n", "<space>rl", jdtls.update_project_config, opts)
  vim.keymap.set(
    "v",
    "<space>em",
    [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
  )
end
-- for completions
local config = {
  on_attach = on_attach,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    "/home/kenshin/.sdkman/candidates/java/17.0.8-amzn/bin/java", -- or "/path/to/java17_or_newer/bin/java"
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:/home/kenshin/.config/nvim/jdtls/lombok.jar",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar",
    "/home/kenshin/.config/nvim/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
    -- Must point to the                                                     Change this to
    -- eclipse.jdt.ls installation                                           the actual version

    -- 💀
    "-configuration",
    "/home/kenshin/.config/nvim/jdtls/config_linux",
    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
    -- Must point to the                      Change to one of `linux`, `win` or `mac`
    -- eclipse.jdt.ls installation            Depending on your system.

    -- 💀
    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew" }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      autobuild = { enabled = false },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      saveActions = {
        organizeImports = true,
      },
      completion = {
        favoriteStaticMembers = {
          "io.crate.testing.Asserts.assertThat",
          "org.assertj.core.api.Assertions.assertThat",
          "org.assertj.core.api.Assertions.assertThatThrownBy",
          "org.assertj.core.api.Assertions.assertThatExceptionOfType",
          "org.assertj.core.api.Assertions.catchThrowable",
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      home = "/home/kenshin/.sdkman/candidates/java/17.0.8-amzn/",
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/home/kenshin/.sdkman/candidates/java/8.0.382-amzn",
          },
          {
            name = "JavaSE-17",
            path = "/home/kenshin/.sdkman/candidates/java/17.0.8-amzn",
          },
          {
            name = "JavaSE-1.7",
            path = "/home/kenshin/.sdkman/candidates/java/7.0.352-zulu",
          },
          {
            name = "JavaSE-11",
            path = "/home/kenshin/.sdkman/candidates/java/11.0.20-amzn",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = "/home/kenshin/.config/nvim/jdtls/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
    },
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
      "/home/kenshin/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.48.0.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/com.microsoft.java.test.plugin-0.39.1.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/com.microsoft.java.test.runner-jar-with-dependencies.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-jupiter-api_5.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-jupiter-engine_5.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-jupiter-migrationsupport_5.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-jupiter-params_5.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-platform-commons_1.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-platform-engine_1.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-platform-launcher_1.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-platform-runner_1.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-platform-suite-api_1.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-platform-suite-commons_1.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-platform-suite-engine_1.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/junit-vintage-engine_5.9.3.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/org.apiguardian.api_1.1.2.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/org.eclipse.jdt.junit4.runtime_1.3.0.v20220609-1843.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/org.eclipse.jdt.junit5.runtime_1.1.100.v20220907-0450.jar",
      -- "/home/kenshin/.config/nvim/vscode-java-test/server/org.opentest4j_1.2.0.jar",
    },
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
