﻿set nocompatible               " be iMproved

set rtp+=~/.fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mhinz/vim-signify'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bbchung/clighter'
Plugin 'Valloric/YouCompleteMe'
"""""""""""""""""""""""""
Plugin 't9md/vim-quickhl'
" (Optional) For quickhl move
Plugin 'kana/vim-operator-user'
"""""""""""""""""""""""""

""" snipmate start
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'
""" snipmate end
Plugin 'bufexplorer.zip'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 보기 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

"에러 발생시에 소리대신 화면이 깜빡이도록함 (disable)
"set visualbell

" 커서의 위치를 항상 보이게 함.
set ruler

" 줄 번호 표시
set number

" 줄 번호 표시 너비 설정
set nuw=5

" 현재 커서 줄 강조
set cursorline

" 항상 status 라인을 표시하도록 함.
set laststatus=2

" Status Line 설정
set statusline=\ %f\ %m%r%h%y\ %w\%=\Line:\%8.(%l%)/%-8.(%L%)\ Colume\ %4.(%c%)%6.([%p%%]%)

if has("gui_running")
    set lines=150
    set co=171
    winp 580 4
endif

" 폰트 설정
if has("gui_running")
    if has("win32")
        set gfn=consolas:h11:cANSI
    elseif has("unix")
        set gfn=consolas\ 9
    else
        set gfn=consolas\ 11
    endif
endif

set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jellybeans_background_color="000000"
" colorscheme jellybeans
"colorscheme gruvbox
colorscheme molokai
"if !has("gui_running")
"   let g:gruvbox_italic = 0
"endif
"let g:gruvbox_invert_signs = 1
"let g:gruvbox_sign_column = 'dark0'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Enable Word wrap
set wrap
set linebreak

" 특수문자(tab, line ending) 표시 안함
set nolist
" tab/End of line characters 설정
set listchars=tab:>-,eol:$

" 괄호의 짝을 Highlight
set showmatch

set foldlevel=3
set foldcolumn=2
set numberwidth=4

" Focus Mode View
function! ToggleFocusMode()
  if (&foldcolumn != 8)
    set numberwidth=6
    set foldcolumn=8
    set noruler
  else
    set numberwidth=4
    set foldcolumn=0
    set ruler
    "execute 'colorscheme ' . g:colors_name
  endif
endfunc
function! FocusModeOff()
  set numberwidth=4
  set foldcolumn=2
  set ruler
endfunc

nnoremap <F1> :call ToggleFocusMode()<cr>

" For Folding
set foldtext=MyFoldText()
function! MyFoldText()
        let line = getline(v:foldstart)
        let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
        return v:folddashes . sub
endfunction

" c, h 파일인 경우 80 column 이상인 경우 표시
if exists('+colorcolumn')
        autocmd BufWinEnter *.c set colorcolumn=80
        autocmd BufWinEnter *.h set colorcolumn=80
else
        autocmd BufWinEnter *.c let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
        autocmd BufWinEnter *.h let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편집 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 명령어 기록을 남길 갯수 지정
set history=1000
"백스페이스 사용
set backspace=indent,eol,start

"백업파일을 만들지 않음
set nobackup

" 완성중인 명령을 표시
set showcmd

" 탭 크기 설정
set tabstop=8
set shiftwidth=8
set softtabstop=0

" 탭 -> 공백 변환 기능 (사용 안함)
set noexpandtab

" 자동 줄바꿈
set wrap

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
"if has("gui_running") || has("xterm_clipboard")
"        set clipboard+=unnamed
"        set clipboard+=unnamedplus
"endif
if !has("gui_running")
	set clipboard+=exclude:.*
endif

" magic 기능 사용 Allows pattern matching with special characters
set magic

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동 안함
set nostartofline

" 비주얼 모드에서의 동작 설정
set sel=inclusive

" SHIFT 키로 선택 영역을 만드는 것을 허용
" 영역 상태에서 Ctrl+F,B 로 이동하면 영역이 해제되어 버려서 해제
set km=startsel,stopsel

" 괄호짝 찾기 기능에 사용자 괄호 종류를 더한다.
set matchpairs+=<:>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 검색 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 검색어 강조 기능
set hlsearch

" 검색시 파일 끝에서 처음으로 되돌리기 안함
set nowrapscan

" 검색시 대소문자를 구별하지 않음
set ignorecase

" 괄호가 매치하는 위치를 보여주는 기능
set showmatch

" Increase Search
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype 기능 & Syntax Highlighting 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 파일의 종류를 자동으로 인식
filetype plugin indent on

" 파일 형식에 따른 Syntax Highlighting 기능을 켠다
syntax enable
filetype on

if has("syntax")
	syntax on
endif

" 내장된 indent 파일이 없어서 C indent 를 사용하는 경우
autocmd FileType javascript setlocal cindent
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 sts=4 expandtab
autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType c,cpp,java set mps+==:;
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자동 들여쓰기 사용
set autoindent
" C indent 사용
set cindent
"Smart indent 사용
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편리한 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"새로운 buffer를 열기전에 이전 buffer를 반드시 저장하지않아도(hidden) 된다
set hidden

" Tab 자동 완성시 가능한 목록을 보여줌
set wildmenu

" /를 입력하여 검색을 시작할 때 자동으로 영문사태로 만들어준다
"set iminsert=0
"set imsearch=0

set comments=sl:/*,mb:\ *,elx:*/

"unix format으로 변경하고,"trailing space 지우기
func! FUNC_dos2unix()
    %s/\s\+$//g
    %s///g
    set ff=unix
endfunc
nmap  <Leader>u :call FUNC_dos2unix()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 기타 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 매크로 실행중에 화면을 다시 그리지 않음
set lz

set mouse=a
set ttymouse=xterm

function! ShowMouseMode()
if (&mouse == 'a')
    echo "mouse-vim"
else
    echo "mouse-xterm"
endif
endfunction

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자주 틀리는 글자 수정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab fucntion function
ab calss class
ab functio function
ab dunction function
ab functuin function
ab dunction function
ab functuin function
ab functopn function
ab fumction function
ab vlass class
ab xlass class
ab classs class
ab forarch foreach
ab inser insert
ab insertt insert
ab quewrty query
ab ovject object
ab objectr object
ab evho echo
ab printr print_r
ab prit print
ab fales false
ab treu true
ab teur true
ab ture true
ab nulll null
ab nuii null
ab retrun return
ab retunr return
ab htis this
ab erturn return
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMD alias
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quitall<bang>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function SetCscope()
 	let curdir = getcwd()

 	while !filereadable("cscope.out") && getcwd() != "/"
 		cd ..
 	endwhile

 	if filereadable("cscope.out")
 		execute "silent cs add " . getcwd() . "/cscope.out"
 		"echo \"Load CSCOPE DONE\"
 	endif

 	execute "cd " . curdir
 endfunction

 "cscope file-searching alternative
 if has('cscope')
 	set cscopetag cscopeverbose

 	if has('quickfix')
 		set cscopequickfix=s-,c-,d-,i-,t-,e-
 	endif
 	cnoreabbrev csa cs add
 	cnoreabbrev csf cs find
 	cnoreabbrev csk cs kill
 	cnoreabbrev csr cs reset
 	cnoreabbrev css cs show
 	cnoreabbrev csh cs help
 	call SetCscope()
 endif
"---------------------------------------------------------------------
" Vimgrep
"---------------------------------------------------------------------
function! Find_current_file(word)
	execute "silent vimgrep " . a:word . " %"
	let l:count = len(getqflist())
	if l:count
		execute "copen"
		nnoremap <silent> <buffer> h  <C-W><CR><C-w>K
		nnoremap <silent> <buffer> H  <C-W><CR><C-w>K<C-w>b
		nnoremap <silent> <buffer> o  <CR>
		nnoremap <silent> <buffer> t  <C-w><CR><C-w>T
		nnoremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
		nnoremap <silent> <buffer> v  <C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t

		exe 'nnoremap <silent> <buffer> e <CR><C-w><C-w>:' . 'c' .'close<CR>'
		exe 'nnoremap <silent> <buffer> go <CR>:' . 'c' . 'open<CR>'
		exe 'nnoremap <silent> <buffer> q  :' . 'c' . 'close<CR>'

		echom "keys: q=quit <cr>/e/t/h/v=enter/edit/tab/split/vsplit go/T/H=preview versions of same"
	endif
endfunction
function! Open_QuickFixList()
	let l:count = len(getqflist())
	if l:count
		execute "copen"
		nnoremap <silent> <buffer> h  <C-W><CR><C-w>K
		nnoremap <silent> <buffer> H  <C-W><CR><C-w>K<C-w>b
		nnoremap <silent> <buffer> o  <CR>
		nnoremap <silent> <buffer> t  <C-w><CR><C-w>T
		nnoremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
		nnoremap <silent> <buffer> v  <C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t

		exe 'nnoremap <silent> <buffer> e <CR><C-w><C-w>:' . 'c' .'close<CR>'
		exe 'nnoremap <silent> <buffer> go <CR>:' . 'c' . 'open<CR>'
		exe 'nnoremap <silent> <buffer> q  :' . 'c' . 'close<CR>'

		echom "keys: q=quit <cr>/e/t/h/v=enter/edit/tab/split/vsplit go/T/H=preview versions of same"
	endif
endfunction
command! -nargs=* CSearch call Find_current_file(<q-args>)
noremap <F3> :call Find_current_file(expand('<cword>'))<CR>
noremap <F11> :call Open_QuickFixList()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_show_linenumbers = 0
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "bottomleft"
let g:tagbar_indent = 1

"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType * nested :call tagbar#autoopen(0)
set <M-L> =l
nmap <M-L> :TagbarOpenAutoClose<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-quickhl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufexplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F11> <leader>be

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F4>hh :help my_git<CR>
nnoremap <silent> <F4> :Gstatus<CR>
nnoremap <silent> <F4>s :Gstatus<CR>
nnoremap <silent> <F4>b :Gblame<CR>
nnoremap <silent> <F4>c :Gcommit<CR>
nnoremap <silent> <F4>l :Git l %<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Space>'
nmap s <Plug>(easymotion-s2)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git', 'perforce' ]
let g:signify_sign_overwrite = 1
let g:signify_update_on_focusgained = 1
let g:signify_update_on_bufenter = 1
let g:signify_line_highlight = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <silent><C-9> <leader>cc
"map <silent><C-0> <Leader>ci
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * RainbowParenthesesActivate 
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List of buffers
function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>] :call fzf#run({
\   'source':      reverse(BufList()),
\   'sink':        function('BufOpen'),
\   'options':     '+m',
\   'tmux_width': '20%'
\ })<CR>
let g:fzf_tmux_height = '20%'
let g:fzf_tmux_width = '20%'
noremap <F12> <ESC>:FZF<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 그외 단축키 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Tab 열기/닫기
map <silent><C-N> :tabnew<CR>
vnoremap q <ESC>

"Move Cusor like readline
noremap <silent><C-A> ^
noremap <silent><C-E> $
inoremap <C-A> <Home>
inoremap <C-E> <End>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
" Remove contents like readline
map <silent><C-K> d$
map <silent><C-U> d^
nmap Y "*yw
noremap <silent><C-P> :set paste<CR>"*p:set nopaste<CR>
inoremap <silent><C-K> <Esc>d$A
inoremap <silent><C-P> <Esc>:set paste<CR>"*p:set nopaste<CR>a
vmap Y "*y
noremap <silent><C-F> <PageUp>
"Remap for navigation
"inoremap <M-H> <Left>
"inoremap <M-L> <Right>
"inoremap <M-J> <Down>
"inoremap <M-K> <Up>
"Force close

"Below command should be map under 'stty -ixon' at terminal
noremap <C-Q> <ESC>:q!<CR>
noremap <C-S> <ESC>:wq<CR>


" S-j/k 로 현재 라인을 위아래로 move
nnoremap <S-Up> :m .-2<CR>==g
nnoremap <S-Down> :m .+1<CR>==g
" "vmap <S-k> [egv
" "vmap <S-j> ]egv
inoremap <S-Up> <Esc>:m .-2<CR>==gi
inoremap <S-Down> <Esc>:m .+1<CR>==gi
vnoremap <S-Up> <Esc>:m .-2<CR>==gv
vnoremap <S-Down> <ESC>:m .+1<CR>==gv
" Ctrl + [ / Ctrl + ] 키로 indentation 조정
nnoremap <C-t> <<
nnoremap <C-y> >>
vnoremap <C-t> <gv
vnoremap <C-y> >gv

" sudo 설정을 이용해서 강제로 저장하기
cnoreab w!! w !sudo tee > /dev/null %
cnoreab W w
cnoreab rmblank g/^$/d
cnoreab Wq wq
cnoreab q q!

" tt키로 currnet word를 변경하기
nnoremap tt diw"*P
vnoremap tt "_dP

inoremap jk <Esc>
"cnoremap jj <Esc>
inoremap ㅓㅏ <ESC>

if has("multi_byte")
	set encoding=utf-8
	setglobal fileencoding=utf-8
	"setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
endif
" 마지막 편집 위치 복원 기능
au BufReadPost *
\ if line("'\"")>0 && line("'\"") <= line("$") |
\ exe "norm g'\"" |
\ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stat functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call ToggleFocusMode()
" Example of how to use w:created in an autocmd to initialize a window-local option
"autocmd WinLeave * :call FocusModeOff()
"autocmd WinEnter * :call FocusModeOff()
