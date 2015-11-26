if has('win32')
	" ������Ϣ����Ϊen
	exec ":lan mes en"
	" ������ɫ
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

let g:LookupFile_MinPatLength = 3               "��������2���ַ��ſ�ʼ����
let g:LookupFile_PreserveLastPattern = 0        "�������ϴβ��ҵ��ַ���
let g:LookupFile_PreservePatternHistory = 1     "���������ʷ
let g:LookupFile_AlwaysAcceptFirst = 1          "�س��򿪵�һ��ƥ����Ŀ
let g:LookupFile_AllowNewFiles = 0              "�������������ڵ��ļ�
"if filereadable("./filenametags")                "����tag�ļ�������
	let g:LookupFile_TagExpr = '"./filenametags"'
"endif

set cindent shiftwidth=4
set nobackup
set cindent tabstop=4
set autowrite

" settings for DoxygenToolkit
let g:DoxygenToolkit_authorName="zkk@crscd.com.cn"
let g:DoxygenToolkit_briefTag_funcName="yes"

" cscope�������
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
	" ȫ��
	autocmd GUIEnter * simalt ~x
	set guifont=courier_new:h14
	"exec ':call libcallnr("vimtweak.dll", "SetAlpha", 230)'
endif

" ���ò����а���ѡ��Ч��
if has("gui_running")
	autocmd InsertLeave * se nocul
	autocmd InsertEnter * se cul
endif

" set expandtab
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
" let Tlist_Show_One_File = 1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1          "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1         "���Ҳര������ʾtaglist����


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

