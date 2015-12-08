" this is the function for doxygen
map <F3>f o**********************************************************\nCopyright(c)2010, Urban Rail Transit Branch, CRSCD, China \n**********************************************************\nO                 All Rights Reserved                      \n<Down>o
map <F3>ic O#include <><Left>
map <F3>m Oint main(int argc, char *argv[]){}<Up>
map <F3>c  O/* */<Left><Left>

" for dot, input label
map <F3>dl ilabel=""<Left>
" for dot, input shape
map <F3>ds ishape=
map <F3>dy i[label="Y"]
map <F3>dn i[label="N"]
" for dot, input frame
"
map <F3>dd Odigraph g_main{ranksep=.2;node [shape=box, fontname="simsun.ttc", fontsize=14];edge [fontname="simsun.ttc", fontsize=12];start[shape=hexagon,style=filled];end[shape=ellipse,style=filled];}O
map <F3>dg O/**@dot@enddot*/<F3>d

" �滻struct,�滻type,�滻���׿ո�,�滻ע��
map <F3>c :%s+[/\*,;<]++g<CR>:%s/\<struct\>//g<CR>:%s/\<\w\+_t\>//g<CR>:%s/\s\+/\t/g<CR>:%s/^\s//g<CR>

" twiki
map <F3>ib :read !twiki.py block 
map <F3>il :read !twiki.py link 
" ����
map <F3>h1 i---+ 
map <F3>h2 i---++ 
map <F3>h3 i---+++ 
map <F3>h4 i---++++ 
" ����
map <F3>b i   
" ���
"
map <F3>tc a    \|<Left><Left><Left>
map <F3>tf a  **  \|<Left><Left><Left><Left>

" End

" Doxygen
map <F3>a :DoxAuthor
map <F3>f :Dox
map <F3>b :DoxBlock
map <F3>c O/**  */<Left><Left><Left>
map <F3>v O/*-  */<Left><Left><Left>
map <F3>; A	/*-<  */<Left><Left><Left>
map <F3>' A	/**<  */<Left><Left><Left>
" End

" setting for ctags
map <C-F12> :!ctags -R -IEXT= --exclude=html --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F11> :!doxygen<CR>
map <C-F9> a\n<Right>

map <M-CR> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 

map <F3>o :Mark SC{\(-*\d\+ \)\{7\}:Mark -*\d\+}s\d\+ \d\+:Mark f\(-*\d\+ \)\+:Mark -*\d\+}v\d\+:g/due/:Tgl

" setting for cscope
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
