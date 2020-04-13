if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-sensible'
"Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()

filetype plugin indent on
syntax on
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*
set expandtab
set shiftwidth=2
set softtabstop=2
set autowrite
set autoread
set incsearch
set number
set numberwidth=4
set ttyfast
set hlsearch
set noshowmode
set t_Co=256

nohlsearch

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Move by screen lines instead of actual lines
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

"Space as an additional leader
map <space> <leader>
inoremap jk <ESC>
nmap <silent> <leader><space> :nohlsearch<cr>

"Wild folder sets
set wildmenu
set wildmode=list:longest,full

" fzf
nmap <C-p> :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>/ :Ag<space>

"quickly edit this file
nmap <leader>ev :e ~/.vimrc<cr>
nmap <leader>sv :so ~/.vimrc<cr>

"Switch to last buffer
nmap gb <C-^>

hi LineNr ctermfg=DarkMagenta ctermbg=Black 
set cursorline
hi CursorLine term=bold cterm=bold  
