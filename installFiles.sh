#!/bin/bash

#this script will install the dot files in this diretory

cp .vimrc ~/.vimrc

cp .bashrc ~/.bashrc

cp .gitconfig ~/.gitconfig

mkdir -p ~/.vim/plugin 
mkdir -p ~/.vim/doc

mkdir -p ~/.vim/autoload 
mkdir -p ~/.vim/syntax 
mkdir -p ~/.vim/vest 

git clone https://github.com/Shougo/vimproc.vim.git
cd vimproc.vim
make -f make_unix.mak

cp -R autoload/* ~/.vim/autoload/
cp -R plugin/* ~/.vim/plugin/

cd ..
rm -rf vimproc.vim

unzip -o snipMate.zip -d ~/.vim

cp javascript.snippets ~/.vim/snippets/

# setup vundle
if [ ! -d "${HOME}/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

vim +BundleInstall +qall
