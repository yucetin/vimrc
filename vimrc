set encoding=utf-8
scriptencoding utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-endwise'
Plug 'wakatime/vim-wakatime' " Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'mhinz/vim-mix-format'
" Plug 'elmcast/elm-vim'
" Plug 'elixir-editors/vim-elixir' " Plug 'luochen1990/rainbow'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
" Plug 'vim-test/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rakr/vim-one'

call plug#end()

syntax on
colorscheme one 
set background=dark 
set termguicolors
let g:airline_theme='one'
" call one#highlight('vimHighlight', 'cccccc', '', 'none')

" Use new regular expression engine
set re=0
set rtp+=~/.vim/bundle/fzf
j
" highlight clear SignColumn
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
highlight Pmenu ctermbg=Blue guibg=Blue
highlight PmenuSel ctermbg=Red guibg=Red
filetype plugin indent on

set linebreak
set number
set hidden
set ignorecase
set smartcase
set showmatch
set shortmess+=I
set mouse=r
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

""Tab for auto-complete
inoremap <Tab> <C-n>

""Use shift-tab to insert a literal tab character
inoremap <S-Tab> <C-V><Tab>
if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif
set ttimeoutlen=0
set wildignore+=*/node_modules/*,*/deps/*,*/tmp/*,*.so,*.swp,*.zip,*/elm-stuff/*,*.beam,_build/*.beam
set omnifunc=syntaxcomplete#Complete

augroup vimrc
    autocmd!
augroup END

let &titlestring = expand("%:p")
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
command! Bd bp|bd #
"open a file where I left off last time
if has('autocmd')
    autocmd vimrc BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') && &filetype !=# 'gitcommit'
                \| exe "normal! '\"" | endif
endif

"Wild mode
set wildmenu
set wildmode=list:longest,full

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

""Switch to last buffer
nmap gb <C-^>

" fzf
nmap <C-p> :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader><CR> :Ag<space>

"Run mix format for elixir files on save
" let g:mix_format_on_save = 1
" let g:mix_format_silent_errors = 1

" let g:elm_setup_keybindings = 0
" let g:polyglot_disabled = ['elm']
" let g:elm_format_autosave = 1

"vim airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline#extensions#whitespace#enabled = 0

"delimitMate
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" let g:rainbow#max_level = 16
" let g:rainbow#pairs = [['(', ')'], ['[', ']']]
" let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gr <Plug>(coc-references)
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> <leader>co  :<C-u>CocList outline<CR>
" let test#strategy = "dispatch"
" nmap <leader>tn :TestNearest<cr>
" nmap <leader>tf  :TestFile<cr>
" nmap <leader>ts  :TestSuite<cr>
" nmap <leader>tl  :TestLast<cr>
" nmap <leader>tv  :TestVisit<cr>
" Typscript stuff
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
