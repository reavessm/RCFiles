#!/bin/bash
# This creates symlinks for these config files.  
# We use symlinks to enable us to update with a simple git pull.

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

ln -s `pwd`/bashrc ~/.bashrc
ln -s `pwd`/bash_aliases ~/.bash_aliases
ln -s `pwd`/mutt/mailcap ~/.mutt/mailcap
ln -s `pwd`/mutt/muttrc ~/.mutt/muttrc
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/neofetch.conf ~/.neofetch.conf
ln -s `pwd`/vim ~/.vim
ln -s `pwd`/signature ~/.mutt/signature
ln -s `pwd`/bash_functions ~/.bash_functions

vim +PlugClean +PlugInstall +PlugUpdate +qa

echo "extends markdown" >  ~/.vim/plugInDir/vim-snippets/UltiSnips/md.snippets
echo "extends cpp" > ~/.vim/plugInDir/vim-snippets/UltiSnips/cc.snippets

popd
