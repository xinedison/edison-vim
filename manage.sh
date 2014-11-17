#!/bin/sh
# Program:
#   .vimrc setting
#   Vundle is used for plugin management

# this manage script can do "install" "update" and "uninstall" work
app_name='edison-vim'

usage(){
	echo "usage: manage.sh <command>"
	echo "The command are:"
	echo "  install	install the vundle and setting vim"
	echo "  update	update the vim setting"
	echo "  uninstall	remove the vim setting"	
}

if [ $# != 1 ]
then
	echo "Error input!"
	usage
	exit 1;
else
	echo "Correct input"
fi
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

