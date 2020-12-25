syntax on

set guicursor=
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode

set cmdheight=2

call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'dylnmc/novum.vim'
call plug#end()

autocmd vimenter * ++nested colorscheme novum

