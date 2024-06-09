" Map leader to comma
let mapleader = ","

" Fast search
nmap <leader>w :w!<cr>

" Show matching brackets when text indicator is over them
set showmatch

" Search while typing
set incsearch

" Highlight search results
set hlsearch

" Enable syntax highlighting
syntax enable

" Set colortheme and transparent background
colorscheme torte
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

" No backup because we have git
set nobackup
set nowb
set noswapfile

" Map search to <space>
map <space> /

" Remap <ESC>
imap jj <ESC>
imap kk <ESC>

" Toggle first letter of word behind cursor
imap <leader>R <ESC>:normal! b~e<cr>

" Keybindings for tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>t<leader> :tabnext<cr>

" Pressing ,ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>
set spelllang=en,de

" Make
map <leader>m :!make &<cr>

" ,c to copy to clipboard
nnoremap ,c "+y

" ,y to paste from clipboard
nnoremap ,y "+p

nnoremap ,s bi`<ESC>ea`<ESC>

" Enable clipboard support
set clipboard=unnamedplus

" Define the key mapping for toggling background transparency
nnoremap ,bg :call ToggleBackgroundTransparency()<CR>

" Function to toggle background transparency
let t:is_transparent = 0
function! ToggleBackgroundTransparency()
	if t:is_transparent == 0
		hi Normal guibg=#111111 ctermbg=black
		let t:is_transparent = 1
	else
		hi Normal guibg=NONE ctermbg=NONE
		let t:is_transparent = 0
	endif
endfunction
