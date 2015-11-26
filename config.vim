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

" settings for DoxygenToolkit
let g:DoxygenToolkit_authorName="zkk@crscd.com.cn"
let g:DoxygenToolkit_briefTag_funcName="yes"

" cscope相关内容
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocsverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set csverbose
	endif
endfunction
" au BufEnter /* call LoadCscope()

if has("cscope")
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif

let OmniCpp_MayCompleteScope = 1
let OmniCpp_ShowPrototypeInAbbr = 1
set completeopt=longest,menu
" End

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

"set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
"set encoding=cp936 fileencoding=cp936 fileencodings=ucs-bom,utf-8,cp936

" set conque_term
let g:ConqueTerm_PyExe = 'C:/python27/python.exe'
let g:ConqueTerm_CodePage = 0
let g:ConqueTerm_SessionSupport = 1
let g:ConqueTerm_InsertOnEnter = 1
" let g:ConqueTerm_ColorMode = 'conceal'

autocmd BufNewFile *.c,*.cpp,*.h,*.sh,*.py exec ":call SetTitle()"
autocmd BufRead *.xml,*.py,*.rst exec ":set enc=utf-8"

