" this is a virmc!

set nocompatible
syntax on
set number
set expandtab
" needed for vundle"
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/unite.vim'
Bundle 'snipMate'
Bundle 'Shougo/vimproc.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'plasticboy/vim-markdown'
Bundle 'ebensing/typescript-vim'
Bundle 'evidens/vim-twig'
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
command Q q

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>s :<C-u>Unite -no-split -buffer-name=files -start-insert -default-action=split file<cr>

nnoremap <space>/ :Unite grep:.<cr>

" folding stuff "
map F $zf%

set nowrap

" typescript stuff "
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" This is to remove windows line endings "
command LE %s///g

" make spell mistakes readable "

hi SpellBad    ctermfg=015      ctermbg=000     cterm=none      guifg=#FFFFFF   guibg=#000000   gui=none
