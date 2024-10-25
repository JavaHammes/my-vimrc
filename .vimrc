" map leader to space
let mapleader = " "

set cursorline
set clipboard=unnamedplus

" Key Mappings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>
nnoremap <leader>Q :q!<CR>

" better searching
set incsearch
set hlsearch
set wrapscan
set ignorecase
set smartcase
set showmatch

" tabwidth to four spaces
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab

syntax enable

" no swap file
set nobackup
set nowb
set noswapfile

set relativenumber
set number

" improve performance
set lazyredraw
set ttyfast

" Enable mouse
set mouse=a

" disable macros
nnoremap q <Nop>

" disable wildmenu
set nowildmenu

" easier resizing of windows
nnoremap <C-Up>    :resize +2<CR>
nnoremap <C-Down>  :resize -2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" remove trailing whitespaces automatically
autocmd BufWritePre * %s/\s\+$//e

" remove unnecessary UI elements
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=b

call plug#begin('~/.local/share/nvim/plugged')

Plug 'github/copilot.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'

call plug#end()

map <C-n> :NERDTreeToggle<CR>

" lightline settings
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'Tomorrow',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

" Enable commenting with vim-commentary
" gcc to comment out a line

" Quick surround example
" cs"' to change surrounding quotes
" ds" to delete surrounding quotes
" ysiw" to surround word with quotes


" Customize colors for vim-gitgutter
" Add: Use green for added lines
highlight GitGutterAdd guifg=#00ff00 guibg=NONE

" Change: Use yellow for modified lines
highlight GitGutterChange guifg=#ffff00 guibg=NONE

" Delete: Use red for removed lines
highlight GitGutterDelete guifg=#ff0000 guibg=NONE

" Enable LSP for Python
lua << EOF
require('lspconfig').pyright.setup{}
EOF

" Enable LSP for C/C++
lua << EOF
require('lspconfig').clangd.setup{}
EOF


" :PlugClean to remove unused plugins
" :PlugUpdate to update plugins
" :PlugInstall to install plugins
