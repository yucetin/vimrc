set encoding=utf-8
scriptencoding utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
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
Plug 'mhinz/vim-mix-format'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'scss', 'json', 'graphql', 'markdown', 'yaml'] }
Plug 'elmcast/elm-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()
let g:gruvbox_contrast_light='hard'
set background=dark
colorscheme gruvbox
set termguicolors
let g:gruvbox_italic=1
" autocmd vimenter * colorscheme gruvbox

filetype plugin indent on
let g:dracula_italic = 0

" syntax on
" colorscheme dracula


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

"Run mix format for elixir files on save
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

let g:elm_setup_keybindings = 0
let g:polyglot_disabled = ['elm']
let g:elm_format_autosave = 1

"vim airline
let g:airline_powerline_fonts = 1
let g:airline_theme= 'gruvbox'
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#whitespace#enabled = 0

"delimitMate
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
