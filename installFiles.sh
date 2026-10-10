#!/bin/bash

#this script will install the dot files in this diretory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bash_git

cp .vimrc ~/.vimrc

echo "source \"$SCRIPT_DIR/.bashrc\"" > ~/.bashrc

cp .gitconfig ~/.gitconfig

if ! command -v entire &>/dev/null; then
  curl -fsSL https://entire.io/install.sh | bash
fi
