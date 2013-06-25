" this is a virmc!

set nocompatible
syntax on
set number
set expandtab

set ts=2
set sw=2

set autoindent
set smarttab
set hlsearch
set incsearch

autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

set tags=tags;/

set spell spelllang=en_us

set colorcolumn=80

filetype plugin on

" these are the NERDcommenter aliases "

map <C-c> <leader>cs
map <C-x> <leader>cu

" something to delete trailing white space "
autocmd BufWritePre *.js :%s/\s\+$//e

" needed for snippets "
filetype plugin on

" because I do this all the time... "

command Wq wq
command W w
