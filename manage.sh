#!/bin/sh
# Program:
#   .vimrc setting
#   Vundle is used for plugin management

# this manage script can do "install" "update" and "uninstall" work
app_name='edison-vim'

help(){
	echo "usage: manage.sh <command>"
	echo "The command are:"
	echo "  install	install the vundle and setting vim"
	echo "  update	update the vim setting"
	echo "  uninstall	remove the vim setting"	
}

# set bundle environment
install_bundle(){
bundle_dir="$HOME/.vim/bundle"
	if [ -d $bundle_dir ];then
		echo "Bundle exist."
	else
		echo "Bundle not exist!Create it."
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi
}

# update vim setting
update_vimrc(){
	cd ~/.vim
	if [ ! -e "$HOME/.vimrc" ];then
		echo "link vimrc"
		ln -s ~/.vim/vimrc ~/.vimrc
	elif [ ! -L "$HOME/.vimrc" ];then
		echo "moving .vimrc to .vimrc.date"
		mv ~/.vimrc ~/.vimrc.`date +%Y%m%d`
		ln -s ~/.vim/vimrc ~/.vimrc
	fi
}

# uninstall the vim setting
uninstall(){
	rm -rf ~/.vim
}

if [ $# != 1 ];then
	echo "Error input!"
	help
	exit 1;
elif ([ $1 = "install" ] || [ $1 = "update" ] || [ $1 = "uninstall" ]);then
	echo "start $1"
	case "$1" in
		"install")
			install_bundle
			update_vimrc
			;;
		"uninstall")
			uninstall
			;;
		"update")
			update_vimrc
			;;
	esac
else
	echo "Unsupported function $1"
	help
	exit 1;
fi
