"=============================================================================
"
" 	First VIM plugin by clark, zkk@mails.tsinghua.edu.cn
"
"	Purpose: When using VI, you can use gf to jump to a specified file
"		After config your g:path option, these path is added to the
"		search path. These simple script can add specific directory to path
"		recursively.
"
"=============================================================================
";;;; 
";;;; These are some Debug command, just reserved
";;;;	 echo "for debug addmisc"
";;;;	 expand('%:h')
";;;;	 let s:fileName = expand('%:h')
";;;;	 let s:cwd = getcwd()
";;;;	 exec "normal O".&g:path
if exists("loaded_addmisc")
    finish
endif
let loaded_addmisc = 1

" mapp the command to Vim
command! -nargs=0 APath :call <SID>AddToPath()
command! -nargs=0 AHead :call <SID>addHeader()
command! -nargs=0 ADate :call <SID>addDate()
command! -nargs=0 ATime :call <SID>addTime()
command! -nargs=0 AWrap :call <SID>addWrap()
command! -nargs=0 MkDot :call <SID>makeDot()
command! -nargs=1 AUnit :call <SID>CppUnitAdd(<q-args>)
command! -nargs=1 DUnit :call <SID>CppUnitDel(<q-args>)

fun! <SID>addWrap()
	exec "normal 040lA"
endfun

fun! <SID>addDate()
	let l:date = strftime(" %Y-%m-%d")
	exec "normal i" . l:date
endfun

fun! <SID>addTime()
	let l:time = strftime(" %T")
	exec "normal i" . l:time
endfun

fun! <SID>addHeader()
	" get the file name without path, and without extension
	"let temp = expand('%:t:r')
	call s:C_PPIfDef('a')
	" call s:C_PPIfDef('v')
endfun

" Function 	: Make dot files
" Purpose  	:
" Author	: zkk@crscd.com.cn
fun! <SID>makeDot()
	let full=expand("%:p")
	let path=expand("%:p:h")
	let filename=expand("%:t")
	execute ":!dot -Tgif ".full." -o ".path."\/_".filename.".gif"
endfun


function! <SID>C_Input ( promp, text )
	echohl Search												" highlight prompt
	call inputsave()										" preserve typeahead
	let	retval=input( a:promp, a:text )	" read input
	call inputrestore()									" restore typeahead
	echohl None													" reset highlighting
	return retval
endfunction    " ----------  end of function C_Input ----------

function! <SID>C_PPIfDef (arg)
	" use filename without path (:t) and extension (:r) :
	let identifier = toupper("_".expand("%:t:r"))."_H"
	" replace non-word characters
	"let identifier = substitute( identifier, '\s',  '_', 'g' )
	"let identifier = substitute( identifier, '\W',  '_', 'g' )
	"let identifier = substitute( identifier, '_\+', '_', 'g' )
	"let	identifier = C_Input("(uppercase) condition for #ifndef : ", identifier )
	if identifier != ""

		if a:arg=='a'
			let zz=    "#ifndef  ".identifier.""
			let zz= zz."#define  ".identifier.""
			let zz= zz.'#ifdef __cplusplusextern "C"{#endif'
			exec "normal mM"
			exec "normal ggO".zz
			let zz=    "#ifdef __cplusplus}#endif"
			let zz= zz."#endif   "."/*".identifier."*/"
			exec "normal Go".zz
			exec "normal 'M"
		endif

		if a:arg=='v'
			let zz=    "#ifndef  ".identifier.""
			let zz= zz."#define  ".identifier.""
			exec "normal mM"
			exec "normal ggO".zz
			let zz=    "#endif   "."/*".identifier."*/"
			exec "normal Go".zz
			exec "normal 'M"
		endif

	endif
endfunction    " ----------  end of function C_PPIfDef ----------

fun! <SID>AddToPath()
	let s:dirlist = ""
	call s:TravelPath('.')
	" replace the .\ to null string if neccessary
	let finaldir = substitute(s:dirlist, '\./', '', "g")
	" check the path
	let temp = expand('%:p:h')
	let temp2 = matchstr(temp, '\/.*$')
	if matchstr(&g:path, temp2) == ''
		let &g:path = &g:path.finaldir
	endif
endfun

"  Strntok (string, tok, n) {{{
" extract the n^th token from s seperated by tok.
" \v(\zs[0-9a-zA-Z_\.\\\/]*\ze,){1}
" 
"
fun! <SID>GetToken(s, n)
	return matchstr( a:s.',', '\v(\zs[0-9a-zA-Z_\.\\\/]*\ze,){'.a:n.'}')
endfun " }}}

"	These two functions are the same
"	But it seems that VIM script could not invoke itself recusively
"	Just copy a routine and rename it. ^_^
"	{{{
fun! <SID>TravelPath(dir)
	let str = a:dir.'/*'
	"let newList = glob(str)
	let newList = substitute(glob(str), "\n", ",", "g")
	"let newList = fileList
	"let newList = substitute(fileList, "\n", ",", "g")
	"let s:dirlist = s:dirlist .newList

	let i = 1
	while 1
		let fileName = s:GetToken(newList, i)
		if fileName == ''
			break
		endif
		"let s:dirlist = s:dirlist . "File ". i . ":". fileName ."\r\n"
		if isdirectory(fileName) 
			if matchstr(fileName , 'html') == ''
				let s:dirlist = s:dirlist ."," . fileName
				call s:TravelPath2(fileName)
			endif
		endif
		let i=i+1
	endwhile
endfun
"	}}}

"	{{{
fun! <SID>TravelPath2(dir)
	let str = a:dir.'/*'
	let newList = substitute(glob(str), "\n", ",", "g")
	" let newList = glob(str)
	let i = 1
	while 1
		let fileName = s:GetToken(newList, i)
		if fileName == ''
			break
		endif
		if isdirectory(fileName)
			if matchstr(fileName , 'html') == ''
				let s:dirlist = s:dirlist ."," . fileName
				call s:TravelPath(fileName)
			endif
		endif
		let i=i+1
	endwhile
endfun
"	}}}

fun! <SID>CppUnitDel(func_name)
	""" get class name
	exec "/class\\s\\+\\w\\+"
	let l:class_line = getline(".")
	let l:class_name = split(l:class_line)[1]
	if l:class_name == ""
		return
	endif

	execute "/".l:class_name."\\s*::\\s*".a:func_name
	execute "/{"
	execute "normal d%"
	execute "%g/".a:func_name."/d"

endfun

fun! <SID>CppUnitAdd(func_name)
	""" get class name
	exec "/class\\s\\+\\w\\+"
	let l:class_line = getline(".")
	let l:class_name = split(l:class_line)[1]
	if l:class_name == ""
		return
	endif
	
	""" insert declaration
	let l:name = a:func_name
	""" 
	exec "/SUITE_END"
	exec "normal OCPPUNIT_TEST(".l:name."		);"
	exec "normal [[%Ovoid ".l:name."		();"

	exec "/CPPUNIT_TEST_SUITE_REGISTRATION"
	exec "normal Ovoid ".l:class_name." :: ".l:name." () /**< auto-generated */{CPPUNIT_ASSERT(0);}"
	exec "normal 2k"
endfun

" new .cc,.java,.sh,
func SetTitle()
    " if file type sh
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line(".")  , "\#########################################################################")
        call append(line(".")+1, "\# Author      : ".g:DoxygenToolkit_authorName)
        call append(line(".")+2, "\# Created Time: ".strftime("%c"))
        call append(line(".")+3, "\# File Name   : ".expand("%"))
        call append(line(".")+4, "\# Description : ")
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "")
        exe "normal G"
    elseif &filetype == 'python' 
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding: utf-8 -*-")
        "if file .h
    elseif strpart(expand("%"), strlen(expand("%"))-1, 1) == 'h'
        exe "AHead"
        exe "DoxAuthor"
    elseif &filetype == 'c' || &filetype == 'cpp'
        exe "DoxAuthor"
    endif
endfunc
