"vimrc by Saul <saul@saulhoward.com>

" Go plugins from go distribution
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

autocmd!
set autoread
set wildmenu
set viminfo=/50,'50,h
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
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set shiftround
set sidescrolloff=2
set scrolloff=2
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

au BufRead,BufNewFile *.pp              set filetype=puppet

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
"clear the search buffer, not just remove the highlight
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

" make space execute the 'q' macro (press qq to start recording, q to
" stop,then [space] to execute.  super convenient)                            
noremap <Space> @q

" -----------------------------------------------------------------------------
" | Plugins                                                                  |
" -----------------------------------------------------------------------------

"" airline settings
" remove separators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" remove unused modes
let g:airline_enable_syntastic=0
let g:airline_theme="dark"
let g:airline_detect_whitespace=0

" tabline at top
let g:airline#extensions#tabline#enabled = 1

" Unite
let g:unite_source_history_yank_enable = 1

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--smart-case --skip-vcs-ignores --nocolor --nogroup --hidden'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color --nogroup --with-filename'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color --nogroup --with-filename'
  let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <leader>t :Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :Unite -no-split -buffer-name=buffer  -wrap buffer<cr>
nnoremap <leader>g :Unite -no-split -buffer-name=grep  grep:.<cr>

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
let g:vimfiler_enable_auto_cd  = 1
" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" nnoremap <silent> <leader>d :<C-u>VimFilerExplorer<CR>
nnoremap <silent> <leader>d :<C-u>VimFiler -quit -buffer-name=explorer<CR>

" Copy file to clipboard
nmap <F3> :silent %w !xclip -selection clipboard<CR>

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]

" goldenview
let g:goldenview__enable_default_mapping = 0
" nmap <silent> <C-L>  <Plug>GoldenViewSplit
nmap <leader>s <Plug>GoldenViewSplit

" -----------------------------------------------------------------------------
" | NeoBundle                                                                 |
" -----------------------------------------------------------------------------

" original repos on github
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'puppetlabs/puppet-syntax-vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'ledger/vim-ledger'
NeoBundle 'bling/vim-airline'
NeoBundle 'zhaocai/GoldenView.Vim'
NeoBundle 'dameninngenn/unite-converter-buffer-simple'
" NeoBundle 'farseer90718/vim-taskwarrior'
" vim-scripts repos
NeoBundle 'vimwiki'
NeoBundle 'fountain.vim'
NeoBundle 'peaksea'
NeoBundle 'zazen'

filetype plugin indent on " required!

" Installation check.
NeoBundleCheck

" Colors **********************************************************************
" Has to be after bundle because theme is loaded then
syntax on
set background=dark
if has("gui_running")
    colorscheme base16-monokai
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
    colorscheme base16-monokai
endif

"unite settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom_source('buffer,buffer_tab', 'filters',
            \ ['converters', 'converter_buffer_simple'])
au BufReadPost *.md call unite#sources#outline#alias('vimwiki', 'markdown')

