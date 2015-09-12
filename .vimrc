set number
set tabstop=4
set shiftwidth=4
set expandtab

set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
"set gfn=Droid\ Sans\ Mono\ 14
set gfn=Monaco\ for\ Powerline\ 14

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-pathogen'
Plug 'Raimondi/delimitMate'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'marijnh/tern_for_vim'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'plasticboy/vim-markdown'
Plug 'flazz/vim-colorschemes'
Plug 'xolox/vim-colorscheme-switcher'
call plug#end()

syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
map <C-n> :NERDTreeToggle<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'nolinkyet',
  \ }


" disable markdown automatic folding
let g:vim_markdown_folding_disabled=1
