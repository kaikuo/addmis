if has('win32')
	" 设置消息语言为en
	exec ":lan mes en"
	" 设置配色
	exec ":colorscheme desert"
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
endif

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

" indent line
" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#7E7E7E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

"let g:indent_guides_auto_colors = 0
"let g:indent_guides_guide_size = 1 
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"hi IndentGuidesOdd guibg=red ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4

" NERDtree
let NERDTreeShowBookmarks=1

" the setting for miniBuffer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
" end

"let g:winManagerWindowLayout = "NERDTree|TagList,miniBufExpl"

let g:LookupFile_MinPatLength = 3               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
"if filereadable("./filenametags")                "设置tag文件的名字
	let g:LookupFile_TagExpr = '"./filenametags"'
"endif

set cindent shiftwidth=4
set nobackup
set cindent tabstop=4
set autowrite
set cmdheight=1

set undofile
set undodir=$HOME/\_undodir
set undolevels=1000 "maximum number of changes that can be undone

" settings for DoxygenToolkit
""""""""""""""""""""""""""""""
let g:DoxygenToolkit_authorName="003"
let g:DoxygenToolkit_briefTag_funcName="yes"

" cscope相关内容
""""""""""""""""""""""""""""""
let g:cscope_silent=1

let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowPrototypeInAbbr = 1
set completeopt=longest,menu
" End

""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""
if has("gui")
	set sessionoptions+=resize,winpos
	" 全屏
	autocmd GUIEnter * simalt ~x
	set guifont=courier_new:h14
	"exec ':call libcallnr("vimtweak.dll", "SetAlpha", 230)'
endif

" 设置插入行包含选中效果
if has("gui_running")
	autocmd InsertLeave * se nocul
	autocmd InsertEnter * se cul
endif

" set expandtab
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
" let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口


" This is for path searching
set path=.,include,../include

"set makeprg=nmake
set tags=tags,../tags,

""""""""""""""""""""""""""""""
"Neo complete configs
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

""""""""""""""""""""""""""""""
"Neo snippet
""""""""""""""""""""""""""""""
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

""""""""""""""""""""""""""""""
" set conque_term
""""""""""""""""""""""""""""""
let g:ConqueTerm_PyExe = 'C:/python27/python.exe'
let g:ConqueTerm_CodePage = 0
let g:ConqueTerm_SessionSupport = 1
let g:ConqueTerm_InsertOnEnter = 1
" let g:ConqueTerm_ColorMode = 'conceal'

""""""""""""""""""""""""""""""
" set airline
""""""""""""""""""""""""""""""
"let g:airline_theme='airlineish'
"let g:airline_inactive_collapse=1

""""""""""""""""""""""""""""""
" set ctrlp
""""""""""""""""""""""""""""""
if has('win32')
	set wildignore+=*\\.git\\*,*\\.svn\\*,*\\proj\\*  " Windows ('noshellslash')
else
	set wildignore+=*/.git/*,*/proj/*,*/.svn/*        " Linux/MacOSX
endif
let g:ctrlp_custom_ignore = {'dir': '\v[\/](proj|\.git)$', 'file': '\v\.(exe|dll|obj|lib|o)'}

""""""""""""""""""""""""""""""
" set encoding
""""""""""""""""""""""""""""""
"set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
"set encoding=cp936 fileencoding=cp936 fileencodings=ucs-bom,utf-8,cp936

autocmd BufNewFile *.c,*.cpp,*.h,*.sh,*.py exec ":call SetTitle()"
autocmd BufRead *.md,*.js,*.xml,*.py,*.rst exec ":set enc=utf-8"
autocmd FileType python setlocal et sta sw=4 sts=4
