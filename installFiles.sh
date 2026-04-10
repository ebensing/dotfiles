#!/bin/bash

#this script will install the dot files in this diretory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

cp .vimrc ~/.vimrc

BASHRC_SOURCE_LINE="source \"$SCRIPT_DIR/.bashrc\""
if ! grep -qF "$BASHRC_SOURCE_LINE" ~/.bashrc 2>/dev/null; then
  echo "" >> ~/.bashrc
  echo "# dotfiles" >> ~/.bashrc
  echo "$BASHRC_SOURCE_LINE" >> ~/.bashrc
fi

cp .gitconfig ~/.gitconfig
