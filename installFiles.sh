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

# Use 1Password's apt repo for op; Ubuntu doesn't package it
if [ ! -f /etc/apt/sources.list.d/1password.list ]; then
  curl -fsSL https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/1password-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | sudo tee /etc/apt/sources.list.d/1password.list > /dev/null \
    && sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22 \
    && curl -fsSL https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol > /dev/null \
    && sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22 \
    && curl -fsSL https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --yes --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg \
    && sudo apt update \
    && sudo apt install -y 1password-cli
fi
