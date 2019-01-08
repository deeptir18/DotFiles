#!/bin/bash

# install vim and zshrc settings
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:deeptir18/DotFiles.git
cp DotFiles/vimrc ~/.vimrc
cp DotFiles/ubuntu_bashrc ~/.bashrc
cp DotFiles/ubuntu_zshrc ~/.zshrc



#vim +PluginInstall +qall
sudo apt-get install cmake

# setup for you complete me
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
./install.py --rust-completer
./install.py --go-completer

cd ..


# mahimahi and rust
curl https://sh.rustup.rs -sSf | sh

sudo apt-get install autotools-dev autoconf libtool apache2 apache2-dev protobuf-compiler libprotobuf-dev libssl-dev xcb libxcb-composite0-dev libxcb-present-dev libcairo2-dev libpango1.0-dev

git clone https://github.com/fcangialosi/mahimahi.git
cd mahimahi  && ./autogen.sh && ./configure && make && sudo make install





