" .vimrc by Saul <saul@saulhoward.com>

" -----------------------------------------------------------------------------
" | General settings                                                                  |
" -----------------------------------------------------------------------------
set nocompatible

"" VUNDLE
filetype off "required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
"" VUNDLE

autocmd!
set autoread
set wildmenu
set viminfo=/50,'50,h

" Custom status line
" set statusline=                              " clear the statusline for when vimrc is reloaded
" set statusline+=%f\                          " file name
" set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
" set statusline+=%{&fileformat}]              " file format
" set statusline+=%h%m%r%w                     " flags
" set statusline+=%{fugitive#statusline()}     " git branch (uses fugitive)
" set statusline+=%=                           "left/right separator
" set statusline+=%b,0x%-6B                    " current char
" set statusline+=%c,%l/                       "cursor column/total lines
" set statusline+=%L\ %P                       "total lines/percentage in file

set hidden
set backspace=indent,eol,start
set number
set showmatch
set matchpairs+=<:>
set comments=s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:-
set encoding=utf-8
set nobackup
set nowb
set noswapfile
set history=100
set autowrite
set report=0
set runtimepath+=~/.vim
set previewheight=8
set ls=2
execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
au CursorHold * checktime

" Tabs **********************************************************************
function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
endfunction

function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

" Tabs should be converted to a group of 4 spaces.
" indent length with < >
set shiftwidth=4
set tabstop=4
"Insert spaces for tabs
set smarttab
set expandtab
set shiftround

" Scrollbars/Status ***********************************************************
set sidescrolloff=2
set scrolloff=2
" set numberwidth=4
set title
set ruler
set showmode
set showcmd
set mouse=a
set ttymouse=xterm "Tmux

" Bash tab style completion is awesome
set wildmode=longest,list
" wildchar-the char used for "expansion" on the command line default value is
" "<C-E>" but I prefer the tab key:
set wildchar=<TAB>
" ignore these files when completing
set wildignore=*~,#*#,*.sw?,*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db,*.class,*.java.html,*.cgi.html,*.html.html,.viminfo,*.pdf

set shortmess=flnrxoOItTA

" Windows *********************************************************************
set splitbelow splitright
set noequalalways

" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn

" Searching *******************************************************************
set hlsearch
set ignorecase
set smartcase
set incsearch
set gdefault
set mousehide

" Omni Completion *************************************************************
" set ofu=syntaxcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Line Wrapping ***************************************************************
set nowrap
set linebreak
" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]
set formatoptions=cq
set textwidth=72
set comments+=b:\"
set comments+=n::

" Colour column
" let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")

" File Stuff ******************************************************************
" To show current filetype use: set filetype
filetype plugin indent on

" Filetypes (au = autocmd)
au FileType helpfile set nonumber      " no line numbers when viewing help
au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

au BufNewFile,BufRead *.html        setf xhtml
au BufNewFile,BufRead *.lzx         setf lzx
au BufNewFile,BufRead *.module      setf php
au BufNewFile,BufRead *.inc         setf php
au BufNewFile,BufRead *.pl,*.pm,*.t setf perl
au BufRead,BufNewFile *.twig set filetype=htmldjango
au FileType c,cpp,slang        set cindent
au FileType c set formatoptions+=ro
au FileType perl set smartindent
au FileType python set formatoptions-=t
au FileType css set smartindent
au FileType xhtml set formatoptions+=l
au FileType xhtml set formatoptions-=t
au FileType htmldjango set formatoptions+=l
au FileType htmldjango set formatoptions-=t

au BufNewFile,BufRead *.txt         setf txt
au FileType txt set formatoptions+=t
au FileType mail set formatoptions+=t

" markdown
au BufRead,BufNewFile *.md set filetype=markdown
augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
    autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END
au BufRead,BufNewFile *.fountain     set filetype=fountain

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.svn,.git,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
au BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
     exe "normal g`\""
    endif
  end
endfunction

" tell complete to look in the dictionary
set complete-=k complete+=k

au FileType * exec('setlocal dict+='.$VIMRUNTIME.'/syntax/'.expand('<amatch>').'.vim')

" Redraw *********************************************************************
set ttyfast
"set ttyscroll=0

" -----------------------------------------------------------------------------
" | Aliases and custom key functions                                          |
" -----------------------------------------------------------------------------
noremap <Space> <PageDown>
nnoremap <F1> :help<Space>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>
map <Esc>[Z <s-tab>
ounmap <Esc>[Z
" use <Ctrl>+N/<Ctrl>+P to cycle through files:
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
" swap windows
nmap , <C-w><C-w>
"move around windows with ctrl key!
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" insert new line without going into insert mode
nnoremap - :put=''<CR>
nnoremap + :put!=''<CR>
" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq
" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$
" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>
" toggle paste on/off
nnoremap \tp :set invpaste paste?<CR>
"toggle list on/off and report the change:
nnoremap \tl :set invlist list?<CR>
"toggle highlighting of search matches, and report the change:
nnoremap \th :set invhls hls?<CR>
"toggle numbers
nnoremap \tn :set number!<Bar> set number?<CR>
"toggle wrap and easy movement keys while in wrap mode
noremap <silent> <Leader>tw :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> k
    silent! nunmap <buffer> j
    silent! nunmap <buffer> 0
    silent! nunmap <buffer> $
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> 0 g0
    noremap  <buffer> <silent> $ g$
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" toggle showbreak for long lines
function! TYShowBreak()
  if &showbreak == ''
    set showbreak=>
    echo "show break on"
  else
    set showbreak=
    echo "show break off"
  endif
endfunction
nmap  <expr> \tb  TYShowBreak()

"clear the fucking search buffer, not just remove the highlight
map \h :let @/ = ""<CR>

" Revert the current buffer
nnoremap \r :e!<CR>

"Easy edit of vimrc
nmap \s :source $MYVIMRC<CR>
nmap \v :e $MYVIMRC<CR>

"show indent settings
nmap \I :verbose set ai? cin? cink? cino? si? inde? indk? formatoptions?<CR>

"replace all tabs with 4 spaces
map \ft :%s/	/    /g<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" reload file as sudo user
cmap w!! %!sudo tee > /dev/null %

" -----------------------------------------------------------------------------
" | Plugins                                                                  |
" -----------------------------------------------------------------------------

" airline
let g:airline_left_sep = '◣'
let g:airline_right_sep = '◢'

" Unite
let g:unite_source_history_yank_enable = 1
nnoremap <leader>t :Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -no-split -buffer-name=buffer  buffer<cr>
" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"vimfiler
let g:vimfiler_as_default_explorer = 1
" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
nnoremap <silent> <leader>d :<C-u>VimFilerExplorer<CR>

"newrw
let g:netrw_hide              = 1
let g:netrw_list_hide         = '^\.svn.*'
let g:netrw_menu              = 0
let g:netrw_silent            = 1
let g:netrw_special_syntax    = 1

" Copy file to clipboard
nmap <F3> :silent %w !xclip -selection clipboard<CR>

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]

" -----------------------------------------------------------------------------
" | VUNDLE                                                                  |
" -----------------------------------------------------------------------------

" original repos on github
Bundle 'saulhoward/molokai'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/unite-outline'
Bundle 'Shougo/vimfiler.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'pangloss/vim-javascript'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
" vim-scripts repos
Bundle 'peaksea'
Bundle 'vimwiki'
Bundle 'fountain.vim'

filetype plugin indent on " required!


" Colors **********************************************************************
" Has to be after Vundle because molokai is loaded
syntax on
set background=dark
if has("gui_running")
    colorscheme tomorrow
    set guifont=Ubuntu\ Mono\ 14
    set guioptions-=m  "menu bar
    set guioptions-=T  "toolbar
    set guioptions+=LlRrb "scrollbars
    set guioptions-=LlRrb
    set lines=73 columns=260
" elseif &diff
"     set t_Co=256
"     set background=dark
"     colorscheme peaksea
else
    set t_Co=256
    colorscheme tomorrow
endif

"unite setting
call unite#filters#matcher_default#use(['matcher_fuzzy'])

