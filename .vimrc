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
