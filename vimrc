set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab 
set encoding=utf-8

set splitright

"VimPlug plugins enabled
call plug#begin()
Plug 'elzr/vim-json'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'nelstrom/vim-markdown-folding'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'liuchengxu/space-vim-theme'
Plug 'sainnhe/gruvbox-material'
Plug 'rktjmp/lush.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'jpalardy/vim-slime'
Plug 'chrisbra/Colorizer'
call plug#end()



if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"theme configuration
"set t_Co=256
set background=dark
syntax on
"let g:one_allow_italics = 1
colorscheme gruvbox
let g:gruvbox_contrast_dark="hard"
hi Normal guibg=NONE ctermbg=NONE
set termguicolors
"hi Normal ctermbg=NONE
"remaps
"
"split windows
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" leader
let mapleader = ","


"NerdTree
let g:NERDTreeWinPos = "right"

" PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4
    "\ set softtabstop=4
    "\ set shiftwidth=4
    "\ set textwidth=79
    "\ set expandtab
    "\ set autoindent
    "\ set fileformat=unix

" latex
let g:vim_markdown_math = 1

" slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
xmap <leader>e <Plug>SlimeRegionSend
nmap <leader>e <Plug>SlimeParagraphSend
