" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
Plugin 'tpope/vim-fugitive'

" General management
Plugin 'L9'
Plugin 'ack.vim'
"Plugin 'nerdtree-ack'
Plugin 'minibufexpl.vim'
Plugin 'sessionman.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/fencview'

" editing
Plugin 'Mark'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'vimwiki'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'brookhong/cscope.vim'

" Documatation
Plugin 'DoxygenToolkit.vim'

" General programming
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'

" C/C++ programming
"Plugin 'Valloric/YouCompleteMe'
Plugin 'a.vim'
"Plugin 'echofunc.vim'
Plugin 'kaikuo/addmis'
if executable('ctags')
	Plugin 'taglist.vim'
	Plugin 'majutsushi/tagbar'
endif

" python programming
"Plugin 'davidhalter/jedi-vim'
Plugin 'pythoncomplete'

" auto complete
Plugin 'Shougo/neocomplete.vim.git'
Plugin 'Shougo/context_filetype.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'
Plugin 'xml.vim'

" other
Plugin 'amirh/HTML-AutoCloseTag'
