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

# Use GitHub's apt repo for gh; Ubuntu's universe package lags far behind
if [ ! -f /etc/apt/sources.list.d/github-cli.list ]; then
  sudo mkdir -p -m 755 /etc/apt/keyrings \
    && sudo curl -fsSL -o /etc/apt/keyrings/githubcli-archive-keyring.gpg https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install -y gh
fi
