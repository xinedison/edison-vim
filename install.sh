#!/bin/sh
# Program:
#   .vimrc setting
#   Vundle is used for plugin management

app_name='edison-vim'

# set bundle environment
bundle_dir="$HOME/.vim/bundle"
if [ -d $bundle_dir ]
then
	echo "Bundle exist."
else
	echo "Bundle not exist!Create it."
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cd ~/.vim
if [ -f "$HOME/.vimrc" ]; then
	mv ~/.vimrc ~/.vimrc.`date +%Y%m%d`
fi


ln -s ~/.vim/vimrc ~/.vimrc

