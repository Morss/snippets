" wget https://raw.githubusercontent.com/Morss/snippets/master/vimrc -O ~/.vimrc

" Map Caps Lock key to Esc
" xmodmap -e "remove Lock = Caps_Lock"
" xmodmap -e "keycode 66 = Escape NoSymbol Escape"
" xmodmap -pke > ~/.xmodmap

" Cursor style
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Mouse support (in tmux)
set ttymouse=xterm2
set mouse=a

" Behavior
set noincsearch
set ignorecase
set smartcase
set noexpandtab
set number

" Faster movement
map J 3j
map K 3k
map H <c-w>h
map L <c-w>l

" Save and quit
noremap <space>w :w<return>
noremap <space>q :q<return>

" Jump to line number and column of mark with '
noremap ' `

" Add empty line in command mode
noremap <return> o<esc>

" Navigate call chains
noremap <s-space> /[.,]<return>/\S<return>

" Substitution for ..
noremap <space>a 0/\.\.<return>vlc

" Substitute current selection with :s//
noremap <space>e y0:s/<c-r>"/

" Change part of camel cased word
noremap <space>p ?[A-Z_.\s]<return>v/[A-Z_.\s(]<return>hc

" Quicky mark and move to position a
noremap <s-m> ma
noremap <space>m `a

" STRINGS
" Jump to string
noremap <space>s f"l
" Jump to string and replace contents with register ""
noremap <space>S f"vi"pyi"0
" Change contents of current string
noremap ss ci"

" Jump to (
noremap <space>h f(

" Join current line with next
noremap <space>j J

" Switch case of current word
noremap <space>` viw~

" Copy line to previous position ('')
noremap <space>c V:co ''<return>zz
noremap <space>C V:co ''-1<return>zz

" Increment first number in line
noremap <space>i 0/[0-9]<return><c-a>0

" Increment current number
noremap <space>n <c-a>

" Delete from cursor to end of line
noremap <space>d D

" Delete from cursor to start of line
noremap <space>D d^i

" Yank inner word
noremap <space>y yiw
noremap <space>t yiw
noremap <space>v viw

" Replace word with register ""
noremap <space>r viwpyiw
noremap <space>R viapyia

" Jump over character with shift space in insert mode
inoremap <s-space> <Esc>la
