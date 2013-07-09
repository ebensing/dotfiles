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

git clone https://github.com/Shougo/unite.vim.git

mkdir -p ~/.vim/autoload && cp -R unite.vim/autoload/* ~/.vim/autoload/
mkdir -p ~/.vim/syntax && cp -R unite.vim/syntax/* ~/.vim/syntax/
mkdir -p ~/.vim/vest && cp -R unite.vim/vest/* ~/.vim/vest/

cp -R unite.vim/doc/* ~/.vim/doc/
cp -R unite.vim/plugin/* ~/.vim/plugin/

rm -rf unite.vim

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
