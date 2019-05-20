""
" .vimrc for peterjpierce
"
" plugins:
"
"   #!/usr/bin/env bash
"
"   DIR=$HOME/.vim; mkdir -p $DIR; cd $DIR
"   git clone git://github.com/tpope/vim-pathogen
"   ln -s vim-pathogen/autoload .
"
"   DIR=$HOME/.vim/bundle; mkdir -p $DIR; cd $DIR
"   git clone git://github.com/kien/ctrlp.vim
"   git clone git://github.com/tpope/vim-surround
"   git clone git://github.com/tpope/vim-fugitive
"   git clone git://github.com/msanders/snipmate.vim
"   git clone git://github.com/peterjpierce/pjp-snippets #(mine)
"   git clone git://github.com/scrooloose/nerdtree

set nocompatible

if !empty($PP)
  let &runtimepath = printf('%s/.vim,%s', $PP, &runtimepath)
endif

execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set directory=/tmp//,.  "so Dropbox doesn't cycle

set number
set hlsearch
set incsearch

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set smartindent
set autoindent
set backspace=eol,start,indent
set wildignore+=*.pyc,*.o,*.swp,*gz,*.zip
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

let mapleader = ","
nmap ) $

"windowing (,w is much easier than ctrl-w)
nmap <leader>w <C-W>
nmap <leader>t :tabnew<cr>

"invoke plugins
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>f :CtrlP<cr>
nmap <leader>d :NERDTreeToggle<cr>

"quickfix navigation
nmap ]q :cnext<cr>
nmap [q :cprevious<cr>

"misc toggles
nmap <leader>l :set list!<cr>
nmap <leader>c :set cursorline!<cr>
set pastetoggle=<F2>

"netrw
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_winsize=30

"toggle colored bar at col=100 with ,v (for Python PEP 8 compliance)
highlight ColorColumn ctermbg=4
function! LineLimitToggle()
  if(&colorcolumn == 100)
    set colorcolumn=0
  else
    set colorcolumn=100
  endif
endfunc
nmap <leader>v :call LineLimitToggle()<cr>

"special indent rules
if has("autocmd")
  autocmd FileType python setlocal ts=4 sts=4 sw=4
endif

"status line
set laststatus=2
set statusline=%t%m%r%h%w\ %y\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ [\%03.3b,\%02.2B]\ [c=%02v,l=%03l/%03L]\ [%p%%]
