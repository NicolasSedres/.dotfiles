return {
  "mfussenegger/nvim-dap",
  keys = {
    {"<leader>db", ":DapToggleBreakpoint<CR>"}
  },
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/cmp-dap",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    -----------------------------NVIM-DAP---------------------------------------------
    -------------dependencies-------------
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()
    require("nvim-dap-virtual-text").setup()
    -----------------DAP-CONFIGS_________________________
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    -----------------Mappings----------------------------
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    function noremap(rhs, lhs, bufopts, desc)
      bufopts.desc = desc
      vim.keymap.set("n", rhs, lhs, bufopts)
    end

    local bufopts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
    noremap("<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, bufopts, "Set conditional breakpoint")
    noremap("<leader>dl", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, bufopts, "Set log point")
    noremap("<leader>dc", dap.continue, bufopts, "Continue")
    noremap("<leader>dt", dap.terminate, bufopts, "Terminate")
    noremap("<leader>dd", dap.disconnect, bufopts, "Disconnect")
    noremap("<leader>dj", dap.step_over, bufopts, "Step over")
    noremap("<leader>dk", dap.step_into, bufopts, "Step into")
    noremap("<leader>do", dap.step_out, bufopts, "Step out")
    noremap("<leader>dr", dap.repl.toggle, bufopts, "Open REPL")
    vim.api.nvim_set_keymap("n", "<leader>du", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>dx", ":lua require('dapui').close()<CR>", { noremap = true })

    -- noremap("<leader>dl", dap.run_last, bufopts, "Run last")
    -- noremap('<leader>di', function() require"dap.ui.widgets".hover() end, bufopts, "Variables")
    -- noremap('<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, bufopts, "Scopes")
    --------------------------SERVER-CONFIGURATIONS--------------------------
    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
      },
    }

    function getSpringBootRunner(profile, debug)
      local debugParam = ""
      if debug then
        debugParam =
        ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"'
      end

      local profilePram = ""
      if profile then
        profilePram = " -Dspring-boot.run.profiles=" .. profile .. " "
      end
      return "mvn spring-boot:run " .. profilePram .. debugParam
    end

    function runSpringBoot(debug)
      vim.cmd("term " .. getSpringBootRunner("local", debug))
    end

    function getTestRunner(testName, debug)
      if debug then
        return 'mvn test -Dmaven.surefire.debug -Dtest="' .. testName .. '"'
      end
      return 'mvn test -Dtest="' .. testName .. '"'
    end

    function runJavaTestMethod(debug)
      local utils = require("utils")
      local methodName = utils.get_current_full_method_name("\\#")
      vim.cmd("term " .. getTestRunner(methodName, debug))
    end

    function runJavaTestClass(debug)
      local utils = require("utils")
      local className = utils.get_current_full_class_name()
      vim.cmd("term " .. getTestRunner(className, debug))
    end

    noremap("<F9>", function()
      runSpringBoot()
    end, bufopts, "run spring boot app")
    noremap("<F10>", function()
      runSpringBoot(true)
    end, bufopts, "run spring boot debug")
    noremap("<leader>tm", function()
      runJavaTestMethod()
    end, bufopts, "run test under cursor")
    noremap("<leader>tM", function()
      runJavaTestMethod(true)
    end, bufopts, "debug test under cursor")
    noremap("<leader>tc", function()
      runJavaTestClass()
    end, bufopts, "run all test from the class")
  end,
}
