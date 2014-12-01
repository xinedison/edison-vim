" the setting file for myself
" notes{
" vim: foldmarker={,} foldmethod=marker
" 
" edison-vim
"
" This is the personal .vimrc file of edison
" }

" Environment{
" "Identify platform{
"    silent function! OSX()
"    	return has('macunix')
"    endfunction
"    silent function! LINUX()
"    	return has('unix') && !has('maxunix') && !has('win32unix')
"    endfunction
"    silent function! WINDOWS()
"    	return (has('win16') || has('win32') || has('win64'))
"    endfunction
" }
"
" }

" Plugin{
" the setting from vundle to management my plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the untime path to include Vundle and initialize
" {
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" the setting from vundle,to management plugin
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin for color schme
Plugin 'altercation/vim-colors-solarized'

" Plugin for source code browsing
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree'
" All of the Plugins must be added before the following line
call vundle#end()            " required
" }

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }

" color {
syntax enable
if has('gui_running')
	set background=light
else
	set background=dark
endif
set t_Co=16
colorscheme solarized
" }

" set the tabstop {
set shiftwidth=4
set tabstop=4
set softtabstop=4
" setting filetype plugin indent on
if has("autocmd")
	filetype on
	filetype indent on
	filetype plugin on
endif
" setting for python indent and fold
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
" }

" the syntax on
syntax on

" set the number for line
set number
" set relativenumber " this is for the relative line number

" the search setting
set incsearch
set hlsearch

" Setting the fold method {
set foldenable
set foldmethod=syntax
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" }

" Ctags {
set tags=./tags;/,~/.vimtags
" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
 let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
" }

" taglist{
nnoremap <F3> :TlistToggle<CR>
let Tlist_Auto_Update=1
let Tlist_Process_File_Always=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_One_File=1
let Tlist_WinWidth=25
let Tlist_Enable_Fold_Column=0
let Tlist_Auto_Highlight_Tag=1
" set TlistWindow on the right
let Tlist_Use_Right_Window = 1
" }

" NERDTree{
" use <F2> to start NERDTree 
nnoremap <F2> :NERDTreeToggle<CR>
" when NERDTree opened，auto show Bookmarks
let NERDTreeShowBookmarks=1
" }
