#!/bin/bash

#ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
#ln -s ~/.dotfiles/vim/.gvimrc ~/.gvimrc

mv ~/.bashrc ~/.bashrc_backup
mv ~/.bash_logout ~/.bash_logout_backup
mv ~/.bash_aliases ~/.bash_aliases_backup

ln -s $PWD/bash/.bashrc ~/.bashrc
ln -s $PWD/bash/.bash_logout ~/.bash_logout
ln -s $PWD/bash/.bash_aliases ~/.bash_aliases
