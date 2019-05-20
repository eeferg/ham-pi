#!/usr/bin/env bash


# Copy dotfiles
cp ./dotfiles/gitconfig $HOME/.gitconfig
cp ./dotfiles/gitignore $HOME/.gitignore
cp ./dotfiles/vimrc $HOME/.vimrc
cp ./dotfiles/tmux.conf $HOME/.tmux.conf
cat ./dotfiles/bashrc_addon >> $HOME/.bashrc
mkdir $HOME/etc
cp ./dotfiles/personal.env $HOME/etc/.
cp ./dotfiles/pyenv.helpers $HOME/etc/.

# Add user to dialout group
sudo usermod -a -G dialout $USER

DIR=$HOME/.vim; mkdir -p $DIR; cd $DIR
git clone git://github.com/tpope/vim-pathogen
ln -s vim-pathogen/autoload .


DIR=$HOME/.vim/bundle; mkdir -p $DIR; cd $DIR
git clone git://github.com/kien/ctrlp.vim
git clone git://github.com/tpope/vim-surround
git clone git://github.com/tpope/vim-fugitive
git clone git://github.com/msanders/snipmate.vim
git clone git://github.com/peterjpierce/pjp-snippets
git clone git://github.com/scrooloose/nerdtree


# install ansible

sudo apt install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible python-simplejson

# install libraries that are not installing with ansible correctly (needs looked at)

sudo apt install -y glib2.0 gtk2.0 goocanvas-2.0 libltdl-dev libtool libudev-dev

# Ansible is a tool to help you automate instals and configurations.  
# I use it in a very basic form here and only install usefull apps and needed libraries

ansible-playbook -i host.inv core_apps.yml --ask-sudo-pass
