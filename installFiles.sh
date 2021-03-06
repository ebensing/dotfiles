#!/bin/bash

#this script will install the dot files in this diretory
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

cp .vimrc ~/.vimrc

cp .bashrc ~/.bashrc

cp .gitconfig ~/.gitconfig


# setup vundle
if [ ! -d "${HOME}/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim +BundleInstall +qall
cp javascript.snippets ~/.vim/bundle/snipMate/snippets/
cp typescript.snippets ~/.vim/bundle/snipMate/snippets/
sudo apt-get install build-essential
cd ~/.vim/bundle/vimproc.vim/ && make -f make_unix.mak
