local options = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.localmapleader = " "

keymap("n", "<leader>e", ":Lex 30<cr>", options)
keymap("n", ";", ":", {noremap = true, silent = false})
keymap("n", "<leader>w", ":up<cr>", {noremap = true, silent = false})
keymap("i", "kj", "<Esc>", options)
keymap("i", "jk", "<Esc>", options)
keymap("v", "<leader>y", [["+y]], options)
keymap("n", "<leader>bd", ":bd<cr>", options)
keymap("n", "<leader>p", ":bprevious<cr>", options)
keymap("n", "<leader>n", ":bnext<cr>", options)

-- window navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", options)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", options)
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", options)

-- bufferline
keymap("n", "gb", "<cmd>BufferLinePick<cr>", options)


--nnoremap <leader>w :up<CR>
--nnoremap <leader>q :q<CR>
--nnoremap <leader>l <C-w>
--nnoremap <C-i> :bn<CR>
--nnoremap <C-b> :CtrlPBuffer<CR>
--nnoremap <leader>gsr :source %<CR>
