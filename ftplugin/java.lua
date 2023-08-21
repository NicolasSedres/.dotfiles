local jdtls = require('jdtls')
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/kenshin/.cache/eclipse/' .. project_name
-- Helper function for creating keymaps
function noremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(client, bufnr)
-----------------------REGULAR LSP KEYMAPS----------------------------------
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  -- noremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
  -- noremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
  -- noremap('<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts, "List workspace folders")
  --------------------------------
  noremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
  noremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
  noremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
  noremap("gr", vim.lsp.buf.references, bufopts)
  noremap('<space>D', vim.lsp.buf.type_definition, bufopts, "Go to type definition")
  noremap("gs", vim.lsp.buf.signature_help, bufopts, "Show signature")
  noremap("<leader>rn", vim.lsp.buf.rename, bufopts, "Rename")
  noremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
  noremap("<leader>f", vim.diagnostic.open_float, bufopts)
  noremap("gl", vim.diagnostic.open_float, bufopts)
  noremap("[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, bufopts)
  noremap("]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, bufopts)
  noremap("<leader>q", vim.diagnostic.setloclist, bufopts)
  noremap("<leader>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
  vim.keymap.set('v', "<space>ca", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap=true, silent=true, buffer=bufnr, desc = "Code actions" })
  noremap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")
-------------------Java extensions provided by jdtls--------------------------
  noremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
  noremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
  noremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
  vim.keymap.set('v', "<space>em", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    { noremap=true, silent=true, buffer=bufnr, desc = "Extract method" })
end
-- for completions
local config = {
  on_attach = on_attach,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    "java", -- or "/path/to/java17_or_newer/bin/java"
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:/home/kenshin/.config/nvim/jdtls/lombok.jar",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",

    -- 💀
    "-jar", "/home/kenshin/.config/nvim/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    "-configuration", "/home/kenshin/.config/nvim/jdtls/config_linux",
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    "-data", workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir =jdtls.setup.find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      configuration = {
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
        }
      }
    }
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
    };
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
