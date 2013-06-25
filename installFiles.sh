#!/bin/bash

#this script will install the dot files in this diretory

cp .vimrc ~/.vimrc

cp .bashrc ~/.bashrc

cp .gitconfig ~/.gitconfig

# install NERD commenter

git clone https://github.com/scrooloose/nerdcommenter.git

mkdir -p ~/.vim/plugin && cp nerdcommenter/plugin/NERD_commenter.vim ~/.vim/plugin/

mkdir -p ~/.vim/doc && cp nerdcommenter/doc/NERD_commenter.txt ~/.vim/doc/

rm -rf nerdcommenter

unzip -o snipMate.zip -d ~/.vim

cp javascript.snippets ~/.vim/snippets/
