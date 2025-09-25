" this is a virmc!

set nocompatible
syntax on
set number
set expandtab
set backspace=2

filetype plugin indent on

set ts=2
set sw=2

set autoindent
set smarttab
set hlsearch
set incsearch

autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

au FileType python setl sw=4 sts=4 et

set spell spelllang=en_us

set colorcolumn=80

filetype plugin on

" something to delete trailing white space "
autocmd BufWritePre *.* :%s/\s\+$//e

" needed for snippets "
filetype plugin on


" because I do this all the time... "

command Wq wq
command W w
command Q q


" folding stuff "
map F $zf%

set nowrap

" This is to remove windows line endings "
command LE %s///g

" make spell mistakes readable "

hi SpellBad    ctermfg=015      ctermbg=000     cterm=none      guifg=#FFFFFF   guibg=#000000   gui=none
