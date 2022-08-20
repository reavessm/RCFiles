#!/bin/bash
# This creates symlinks for these config files.  
# We use symlinks to enable us to update with a simple git pull.

# TODO: Make list of normal packages (git, vim, alacritty, rofi, i3-gaps)
#       and make the installable regardless of distro/packagemanager

pushd ~/.RCFiles/

mkdir -p ~/.mutt

# Backup files if they are not symbolic links and are different from what we
# have
[[ -f ~/.bashrc && ! -L ~/.bashrc && -n "`diff ~/.bashrc ./bashrc`" ]] \
  && mv ~/.bashrc ~/.bashrc.orig
[[ -f ~/.bash_aliases && ! -L ~/.bash_aliases && -n "`diff ~/.bash_aliases bash_aliases`" ]] \
  && mv ~/.bash_aliases ~/.bash_aliases.orig 
[[ -f ~/.neofetch.conf && ! -L ~/.neofetch.conf && -n "`diff ~/.neofetch.conf neofetch.conf`" ]]\
  && mv ~/.neofetch.conf ~/.neofetch.conf.orig 
[[ -f ~/.bash_functions && ! -L ~/.bash_functions && -n "`diff \
  ~/.bash_functions bash_functions`" ]] && mv ~/.bash_functions \
  ~/.bash_functions.orig
[[ -f ~/.tmux.conf && ! -L ~/.tmux.conf && -n "`diff \
  ~/.tmux.conf tmux.conf`" ]] && mv ~/.tmux.conf \
  ~/.tmux.conf.orig
mkdir -p ~/.config/alacritty && [[ -f ~/.config/alacritty/alacritty.yml && ! \
  -L ~/.config/alacritty/alacritty.yml && -n "`diff \
  ~/.config/alacritty/alacritty.yml alacritty.yml`" ]] \
  && mv ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.orig

ln -s `pwd`/bashrc ~/.bashrc
ln -s `pwd`/bash_aliases ~/.bash_aliases
ln -s `pwd`/neofetch.conf ~/.neofetch.conf
ln -s `pwd`/bash_functions ~/.bash_functions
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s `pwd`/nvim ~/.config/nvim
ln -s `pwd`/ascii ~/.ascii

#echo "extends markdown" >  ~/.vim/plugInDir/vim-snippets/UltiSnips/md.snippets
#echo "extends cpp" > ~/.vim/plugInDir/vim-snippets/UltiSnips/cc.snippets

popd
