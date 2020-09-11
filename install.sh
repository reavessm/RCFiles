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
[[ -f ~/.mutt/mailcap && ! -L ~/.mutt/mailcap && -n "`diff ~/.mutt/mailcap mutt/mailcap`" ]] \
  && mv ~/.mutt/mailcap ~/.mutt/mailcap.orig 
[[ -f ~/.mutt/muttrc && ! -L ~/.mutt/muttrc && -n "`diff ~/.mutt/muttrc mutt/muttrc`" ]] \
  && mv ~/.mutt/muttrc ~/.mutt/muttrc.orig 
[[ -f ~/.vimrc && ! -L ~/.vimrc && -n "`diff ~/.vimrc vimrc`" ]]\
  && mv ~/.vimrc ~/.vimrc.orig 
[[ -f ~/.neofetch.conf && ! -L ~/.neofetch.conf && -n "`diff ~/.neofetch.conf neofetch.conf`" ]]\
  && mv ~/.neofetch.conf ~/.neofetch.conf.orig 
[[ -d ~/.vim && ! -L ~/.vim && -n "`diff ~/.vim vim `" ]] \
  && mv ~/.vim ~/.vim.orig 
[[ -f ~/.bash_functions && ! -L ~/.bash_functions && -n "`diff \
  ~/.bash_functions bash_functions`" ]] && mv ~/.bash_functions \
  ~/.bash_functions.orig
[[ -f ~/.config/i3/config && ! -L ~/.config/i3/config && -n "`diff \
  ~/.config/i3/config i3config`" ]] && mv ~/.config/i3/config \
  ~/.config/i3/config.orig
[[ -f ~/.tmux.conf && ! -L ~/.tmux.conf && -n "`diff \
  ~/.tmux.conf tmux.conf` ]] && mv ~/.tmux.conf \
  ~/.tmux.conf.orig
mkdir -p ~/.config/alacritty && [[ -f ~/.config/alacritty/alacritty.yml && ! \
  -L ~/.config/alacritty/alacritty.yml && -n "`diff \
  ~/.config/alacritty/alacritty.yml alacritty.yml ]] \
  && mv ~/.config/alacritty/alacritty.yml \
  ~/.config/alacritty/alacritty.yml.orig

ln -s `pwd`/bashrc ~/.bashrc
ln -s `pwd`/bash_aliases ~/.bash_aliases
ln -s `pwd`/mutt/mailcap ~/.mutt/mailcap
ln -s `pwd`/mutt/muttrc ~/.mutt/muttrc
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/neofetch.conf ~/.neofetch.conf
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/signature ~/.mutt/signature
ln -s `pwd`/bash_functions ~/.bash_functions
ln -s `pwd`/config ~/.config/i3/config # After installing rofi and alacritty
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/alacritty.yml ~/.config/alacritty/alacritty.yml
cp -r alacritty-theme ~/.config/alacritty

vim +PlugClean +PlugInstall +PlugUpdate +qa

echo "extends markdown" >  ~/.vim/plugInDir/vim-snippets/UltiSnips/md.snippets
echo "extends cpp" > ~/.vim/plugInDir/vim-snippets/UltiSnips/cc.snippets

popd
