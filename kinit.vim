"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set env of vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" load plugins
if filereadable(expand("~/.vim/vundle.list.vim"))
	source ~/.vim/vundle.list.vim
endif

" implement plugins
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.vim/config.vim"))
	source ~/.vim/config.vim
else
	syntax on
	set hlsearch

	set nocp
	filetype plugin on
	set shellslash
	"set ignorecase
	set grepprg=grep\ -nH\ $*
	filetype indent on

	set guioptions-=T
	"set guioptions-=m
	set guioptions-=L
	set guioptions-=r

	" the setting for miniBuffer
	let g:miniBufExplMapWindowNavVim = 1 
	let g:miniBufExplMapWindowNavArrows = 1 
	let g:miniBufExplMapCTabSwitchBufs = 1 
	let g:miniBufExplModSelTarget = 1 
	" end

	if has("gui")
		set sessionoptions+=resize,winpos
		set lines=500
		set columns=500
	endif

	set cindent shiftwidth=4
	set nobackup
	set cindent tabstop=4
	set autowrite
endif

if filereadable(expand("~/.vim/mykey.vim"))
	source ~/.vim/mykey.vim
endif

