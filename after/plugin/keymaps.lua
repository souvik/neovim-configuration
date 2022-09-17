local opts = { noremap = true, silent = true }

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
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers -- NOTE: replaced with barbar keymaps
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Insert blank line
keymap("n", "]<Space>", "o<Esc>", opts)
keymap("n", "[<Space>", "O<Esc>", opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', opts)

-- Telescope Keymaps
keymap("n", "<Leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", "<Leader>fb", "<Cmd>lua require('telescope.builtin').buffers({ignore_current_buffer=true, only_cwd=true})<CR>", opts)
keymap("n", "<Leader>bl", "<Cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)
keymap("n", "<Leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", "<Leader>fG", "<Cmd>lua require('telescope.builtin').live_grep({grep_open_file=true})<CR>", opts)
keymap("n", "<Leader>fj", "<Cmd>lua require('telescope.builtin').jumplist()<CR>", opts)
keymap("n", "<Leader>fr", "<Cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
keymap("n", "<Leader>fd", "<Cmd>lua require('telescope.builtin').file_browser()<CR>", opts)

-- NvimTree keymap
keymap("n", "<Leader>e", "<Cmd>lua require('nvim-tree').toggle(true, true)<CR>", opts)

-- Hop Keymaps
keymap("n", "<Leader>w", "<Cmd>lua require('hop').hint_words()<CR>", opts)
-- keymap("n", "<Leader>f", "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", opts)
-- keymap("n", "<Leader>F", "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", opts)
-- keymap("n", "<Leader>t", "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>", opts)
-- keymap("n", "<Leader>T", "<Cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>", opts)

-- Barbar Keymaps
-- Magic buffer-picking mode
keymap("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
keymap("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
