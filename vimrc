set encoding=utf-8
scriptencoding utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-endwise'
Plug 'wakatime/vim-wakatime'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()

filetype plugin indent on
let g:dracula_italic = 0

syntax on
colorscheme dracula

set linebreak
set number
set hidden
set ignorecase
set smartcase
set showmatch
set shortmess+=I
set mouse=a
set showcmd

set noswapfile
set nobackup
set autoread
set nolazyredraw
set hlsearch

"Indent settings
set expandtab
set shiftwidth=2
set softtabstop=2
set cindent

"Tab for auto-complete
inoremap <Tab> <C-n>

"Use shift-tab to insert a literal tab character
inoremap <S-Tab> <C-V><Tab>

set ttimeoutlen=0

set wildignore+=*/node_modules/*,*/deps/*,*/tmp/*,*.so,*.swp,*.zip
set omnifunc=syntaxcomplete#Complete

augroup vimrc
    autocmd!
augroup END

set title
autocmd vimrc BufEnter * let &titlestring = 'vim ' . expand("%:p")

nnoremap <C-n> :NERDTreeToggle<Enter>"

"Move by screen lines instead of actual lines
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

"Space as an additional leader
map <space> <leader>
inoremap jk <ESC>
nmap <silent> <leader><space> :nohlsearch<cr>

"Prevent searches being highlighed when vimrc reloads
nohlsearch

"use %% to get current dir in ex
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"quickly edit this file
nmap <leader>ev :e ~/.vimrc<cr>
nmap <leader>sv :so ~/.vimrc<cr>

"Quit vim with Q as well as q
command! Q q
command! W w

"open a file where I left off last time
if has('autocmd')
    autocmd vimrc BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') && &filetype !=# 'gitcommit'
                \| exe "normal! '\"" | endif
endif

"Wild mode
set wildmenu
set wildmode=list:longest,full

"Make background transparent
hi Normal ctermbg=none
hi NonText ctermbg=none

"Highlight current line number
hi clear CursorLine  
hi CursorLineNR cterm=bold 
set cursorline 

"Undo tree
"Persistent undo
if has('persistent_undo')
    set undodir=~/.vim/undodir/
    set undofile
endif

"Switch to last buffer
nmap gb <C-^>

" fzf
nmap <C-p> :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>/ :Ag<space>

