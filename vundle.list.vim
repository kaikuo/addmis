" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
Plugin 'tpope/vim-fugitive'

" General management
Plugin 'L9'
Plugin 'minibufexpl.vim'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'scrooloose/nerdtree'

" editing
Plugin 'Mark'

" Documatation
Plugin 'DoxygenToolkit.vim'

" General programming
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'

" C/C++ programming
Plugin 'a.vim'
Plugin 'echofunc.vim'
Plugin 'kaikuo/addmis'
if executable('ctags')
	Plugin 'taglist.vim'
	Plugin 'majutsushi/tagbar'
endif

" auto complete
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" other
Plugin 'pythoncomplete'
Plugin 'amirh/HTML-AutoCloseTag'
