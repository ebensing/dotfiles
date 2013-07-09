#!/bin/bash

# this is a script to compile vim from source, also installs all the pre-reqs to do so

# pre-reqs
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev checkinstall \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial

# remove old stuff
sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common

# build it
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim73
sudo checkinstall

# set defaults
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim
