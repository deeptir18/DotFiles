#!/bin/bash

# install vim and zshrc settings
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rustup add component rust-analyzer
cp DotFiles/vimrc ~/.vimrc
cp DotFiles/ubuntu_bashrc ~/.bashrc
cp DotFiles/ubuntu_zshrc ~/.zshrc
cp DotFiles/tmux_conf ~/.tmux.conf

# vim plug and install vim dependencies
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

#tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# powerline command line
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# rust
#curl https://sh.rustup.rs -sSf | sh
#source $HOME/.cargo/env
#rustup default nightly

# source
#source ~/.bashrc
#source ~/.zshrc
git config --global core.editor "vim"
git config --global user.name "Deepti Raghavan"
git config --global user.name "deeptir@cs.stanford.edu"

# install tmux plugins
# start a server but don't attach to it
tmux start-server
# create a new session but don't attach to it either
tmux new-session -d
# install the plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
# killing the server is not required, I guess
tmux kill-server

