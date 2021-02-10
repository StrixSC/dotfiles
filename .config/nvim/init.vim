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
set guioptions+=d


" disable stupid exmode
:map Q <Nop>

" remap capital :W to :w
noremap :W :w
noremap :Q :q
" map leader is a space in this case
let mapleader = " "

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

Plug 'dikiaap/minimalist'
Plug 'leafgarland/typescript-vim'
Plug 'dylnmc/novum.vim'
Plug 'dracula/vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'dense-analysis/ale'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'itchyny/lightline.vim'

""Vim Better Whitespace Plug
":ToggleWhitespace
":StripWhitespace
Plug 'ntpeters/vim-better-whitespace'

"Automatic close for common block and scope identifiers such as brackets
" parentheses, brace, squares
"https://github.com/jiangmiao/auto-pairs
Plug 'Raimondi/delimitMate'

" :GitLog
Plug 'kablamo/vim-git-log'

" Install fonts for vim-devicons from https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'

"Show which line changed since your last commit.
"GitGutterToggle
Plug 'airblade/vim-gitgutter'
"For commenting and uncommenting blocks of line

Plug 'preservim/nerdtree'

" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

map <silent> <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=0

filetype plugin on

" enable syntax and plugins
syntax enable
filetype plugin on

set formatoptions-=r " don't auto insert comment leader on enter in insert
set formatoptions-=o " don't auto insert comment leader on o/O in normal mode
set formatoptions-=c " don't auto-wrap comments using textwidth, inserting the current comment leader automatically

" show numbers
set number
set relativenumber

" removes newline EOL
" so other non vim/terminal editors don't see extra line
set binary
set noeol

"spaces instead of tab, must be after binary and noel setting
set expandtab

"show status at the bottom of vim file
set laststatus=2

"tail of the filename
set statusline=%f

"Auto indent
set autoindent

" does the right thing (mostly) in programs
set smartindent

" Don’t update screen during macro and script execution.
set lazyredraw

"showcmd show input of incomplete command.
set sc

" show will briefly jump to the matching brace when you insert one
set showmatch

"enable cursor line
"set cursorline

set background=dark
"set background=light
"Sometimes it is helpful if your working directory
"is always the same as the file you are editing.
"To achieve this, put the following in your vimrc:
"set autochdir

" yy will not just use internal vim buffer but will also copy
" into OS's clipboard
set clipboard=unnamedplus
"Allow mouse to scroll the vim windows and resize splits
set mouse=a

"" toggle line numbers
noremap <leader><leader>ln :set rnu!<CR>

"Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8
set fileencoding=utf8

set incsearch

"space space y will copy all the text
map <Leader><Leader>y :%y+<CR>
"pick random color scheme
map <Leader>rc :RandomColorScheme<CR>
nmap <C-P> :FZF<CR>
"compiling and running c++ files
"autocmd filetype cpp nnoremap <leader><leader>4 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++11 -O2 % -o %:r && ./%:r <CR>
"autocmd filetype cpp nnoremap <leader<leader>5 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++11 -O2 % -o %:r && ./%:r < ./input.txt<CR>
"c++2a - working draft for ISO C++ 2020 standard
"
"-g is debug mode
"-O0 optimization for compilation time (default)
"-O2 optimization mre for code size and execution time
autocmd filetype cpp nnoremap <leader><leader>0 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++2a -g -O2 % -o %:r && ./%:r <CR>
autocmd filetype cpp nnoremap <leader><leader>00 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++2a -g -O2 % -o %:r && ./%:r < ./input.txt<CR>

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y

let g:lightline = { 'colorscheme': 'challenger_deep'}
colorscheme Drakos
" Display all matching files when we tab complete
set wildmenu

if has('nvim') || has('termguicolors')
  set termguicolors
endif