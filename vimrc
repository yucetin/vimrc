if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-sensible'
"Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
hi LineNr ctermfg=DarkMagenta ctermbg=Black 
set cursorline
hi CursorLine term=bold cterm=bold  
