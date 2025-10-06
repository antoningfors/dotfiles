" Disable Vi compatible
set nocompatible
set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	GENERAL	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable	" Enable syntax highlighting
set number	" Enable line number
set rnu 	" Enable relative number
set cursorline	" Highlight current line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	INFORMATION	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set title 		" Show the filename in the window titlebar
set showmode		" Show the current mode in command-line
set laststatus=2	" Always show status bar over command line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	FEATURES	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu	" Enhance command-line completion
" Use OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

au BufRead,BufNewFile *.md setl ft=md
au BufRead,BufNewFile *.cpp setl ft=cpp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	KEYMAPPINGS and INPUT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Needs to be declared before any leader map using leader
let mapleader = "," 
" turn off search highlight
map <leader><space> :nohlsearch<CR>
"build on F7
map<F7>  :make!<bar>:botright cwindow<CR>
imap<F7> <ESC>:make!<bar>:botright cwindow<CR>
"debug on F5
map<F5> :!lldb -f build/app<CR>
imap<F5> <ESC>:!lldb -f build/app<CR>
" Move vertically by visual line instead of actual line
nnoremap j gj
nnoremap k gk

" Enable mouse in all modes
set mouse=a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	FONTS and GRAPHICS	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Solarized Dark Theme 
set background=dark
colorscheme anton
let g:solarized_termtrans=1

" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	GVIM	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	PATHOGEN	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	SEARCHING	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	INDENTATION	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent on	" Automatically switch to cindent if it is supported
set shiftwidth=4	" Make autoindentation four spaces
set tabstop=4		" Make your tabs as wide as four spaces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	SWAP AND BACKUP	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	FIX ANNOYING FEATURES	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set novisualbell 	" Disable visalbell
set t_vb=
