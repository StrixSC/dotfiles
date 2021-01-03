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
set relativenumber
set cmdheight=2

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'
Plug 'dylnmc/novum.vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()

colorscheme codedark

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * highlight LineNr ctermfg=NONE ctermbg=NONE

map <silent> <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

