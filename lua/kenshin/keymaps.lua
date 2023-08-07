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
--keymap("n", "<leader>pv", ":Lex 30<cr>", opts)
keymap("n", "<leader>pv", "<cmd>NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Search --
keymap("n", "<leader>pf", "<cmd>Telescope find_files<cr>", opts)
--keymap("n", "<leader>pf", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>ps","<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>pb","<cmd>Telescope buffers<cr>", opts)

-- -- window management
keymap("n", "<leader>sv", "<C-w>v",opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s",opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=",opts) -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>",opts) -- close current split window

keymap("n", "<leader>to", ":tabnew<CR>",opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>",opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>",opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>",opts) --  go to previous tab
-- vim-maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>",opts) -- toggle split window maximization
-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>",opts)

-- delete single character without copying into register
keymap("n", "x", '"_x',opts)

