local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
--OpenFileExplorer
keymap("n", "<leader>pv", "<CMD>Oil<CR>", opts)

-- Navigate buffers
keymap("n", "¬", ":bnext<CR>", opts)
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "˙", ":bprevious<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
keymap("n", "<leader>ren", "<cmd>set relativenumber!<cr>", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts)
-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv=gv", opts)
keymap("v", "K", ":move '<-2<CR>gv=gv", opts)
keymap("n", "J", "mzJ`z", opts)-- move text up but let the cursor in place

-- Search --
keymap("n", "<leader>pf", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>ps","<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>pb","<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>pB","<cmd>Telescope dap list_breakpoints<cr>", opts)
keymap("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts) -- search and replace

-- -- window management
keymap("n", "<leader>sv", "<C-w>v",opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s",opts) -- split window horizontally
keymap("n", "<leader>sr", "<C-w>=",opts) -- make split windows equal width & height
keymap("n", "<leader>sd", ":close<CR>",opts) -- close current split window
keymap("n", "<leader>bd", ":bd<CR>",opts) -- close current buffer 

keymap("n", "<leader>to", ":tabnew<CR>",opts) -- open new tab
keymap("n", "<leader>td", ":tabclose<CR>",opts) -- close current tab
keymap("n", "<leader>tl", ":tabn<CR>",opts) --  go to next tab
keymap("n", "<leader>th", ":tabp<CR>",opts) --  go to previous tab
-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>",opts) -- toggle split window maximization
-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>",opts)

-- delete single character without copying into register
keymap("n", "x", '"_x',opts)
-- check the current buffer path
keymap("n", "<leader>pwd", ":echo expand('%:p')<CR>",opts)
