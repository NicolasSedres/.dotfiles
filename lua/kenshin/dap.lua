-----------------------------NVIM-DAP---------------------------------------------
local dap = require('dap')
require('dapui').setup()
require('nvim-dap-virtual-text').setup()
vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
function noremap(rhs, lhs, bufopts, desc)
  bufopts.desc = desc
  vim.keymap.set("n", rhs, lhs, bufopts)
end
local bufopts = { noremap=true, silent=true}
-- noremap("<leader>bc", dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')), bufopts, "Set conditional breakpoint")
-- noremap("<leader>bl", dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')), bufopts, "Set log point")
noremap('<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', bufopts, "List breakpoints")
noremap("<leader>dc", dap.continue, bufopts, "Continue")
noremap("<leader>dj", dap.step_over, bufopts, "Step over")
noremap("<leader>dk", dap.step_into, bufopts, "Step into")
noremap("<leader>do", dap.step_out, bufopts, "Step out")
noremap('<leader>dd', dap.disconnect, bufopts, "Disconnect")
noremap('<leader>dt', dap.terminate, bufopts, "Terminate")
noremap("<leader>dr", dap.repl.toggle, bufopts, "Open REPL")
noremap("<leader>dl", dap.run_last, bufopts, "Run last")
noremap('<leader>di', function() require"dap.ui.widgets".hover() end, bufopts, "Variables")
noremap('<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end, bufopts, "Scopes")
noremap('<leader>dh', '<cmd>Telescope dap commands<cr>', bufopts, "List commands")
noremap('<leader>df', '<cmd>Telescope dap frames<cr>', bufopts, "List frames")
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>du", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dx", ":lua require('dapui').close()<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap=true})

dap.configurations.java = {
  {
    type = 'java';
    request = 'attach';
    name = "Debug (Attach) - Remote";
    hostName = "127.0.0.1";
    port = 5005;
  },
}
