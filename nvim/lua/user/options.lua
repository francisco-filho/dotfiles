local opt = vim.opt

opt.number=true
opt.tabstop=4
opt.shiftwidth=4
opt.expandtab=true
opt.encoding="utf-8"
opt.cursorline=true
opt.colorcolumn="100"
opt.mouse="v"
opt.splitright=true
opt.signcolumn="yes"
opt.termguicolors=true
opt.background="dark"

vim.cmd [[set list]]
--vim.cmd [[listchars=eol:]]
vim.cmd [[syntax enable]]
vim.cmd [[set completeopt=menu,menuone,noselect]]

-- autocommands
-- autocmd BufWritePost init.vim source $MYVIMRC
vim.cmd [[autocmd BufRead *.md set nofoldenable]]

-- colorscheme
vim.cmd 'colorscheme one'

vim.cmd 'autocmd FileType typescript setlocal ts=2 sts=2 sw=2'
