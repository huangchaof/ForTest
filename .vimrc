“C:\Users\hcf\Desktop\ForTest 要在msys2里打开此路径，需要加上双引号”“
syntax on   
set nu   
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
set cursorline              " 突出显示当前行
set clipboard+=unnamed		"共享剪贴板  ,系统剪切板的东西可以复制到vim,按下p
colorscheme murphy

" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
 
set matchtime=1
" 侦测文件类型
filetype on

"自动补全
 
:inoremap ( ()<ESC>i
 
:inoremap ) <c-r>=ClosePair(')')<CR>
 
:inoremap { {<CR>}<ESC>O
 
:inoremap } <c-r>=ClosePair('}')<CR>
 
:inoremap [ []<ESC>i
 
:inoremap ] <c-r>=ClosePair(']')<CR>
 
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on
"打开文件类型检测, 加了这句才可以用智能补全
 
set completeopt=longest,menu


"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
 
""定义函数SetTitle，自动插入文件头
 
func SetTitle()
 
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
 
        call append(line("."), "\# File Name: ".expand("%"))
 
        call append(line(".")+1, "\# Author: Noone")
 
        call append(line(".")+2, "\# mail: Noone@qq.com")
 
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
 
        call append(line(".")+4, "\#########################################################################")
 
        call append(line(".")+5, "\#!/bin/bash")
 
        call append(line(".")+6, "")
 
    else
 
        call setline(1, "/*************************************************************************")
 
        call append(line("."), " > File Name: ".expand("%"))
 
        call append(line(".")+1, " > Author: Noone")
 
        call append(line(".")+2, " > Mail: Noone@qq.com ")
 
        call append(line(".")+3, " > Created Time: ".strftime("%c"))
 
        call append(line(".")+4, " ************************************************************************/")
 
        call append(line(".")+5, "")
 
    endif
 
    if &filetype == 'cpp'
 
        call append(line(".")+6, "#include<iostream>")
 
        call append(line(".")+7, "using namespace std;")
 
        call append(line(".")+8, "")
 
    endif
 
    if &filetype == 'c'
 
        call append(line(".")+6, "#include<stdio.h>")
 
        call append(line(".")+7, "")
 
    endif
 
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc