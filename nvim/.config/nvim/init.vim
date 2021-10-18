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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'lifepillar/pgsql.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'dense-analysis/ale'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'itchyny/lightline.vim'

Plug 'sevko/vim-nand2tetris-syntax'
Plug 'scrooloose/nerdcommenter'

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
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>

"So you dont mess up your pinky pressing the control key 10000 times per file  
nmap <leader>w :w<CR>

let NERDTreeShowHidden=0

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
set clipboard=unnamedplus
set mouse=a

" toggle line numbers
noremap <leader><leader>ln :set rnu!<CR>

" Tab stuff:
noremap <leader>t :tabnew tmp<CR><CR>
noremap <leader>1 1gt <CR><CR>
noremap <leader>2 2gt <CR><CR>
noremap <leader>3 3gt <CR><CR>
noremap <leader>4 4gt <CR><CR>
noremap <leader>5 5gt <CR><CR>
noremap <leader><tab> :tabnext<CR>

"Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8
set fileencoding=utf8

set incsearch

"space space y will copy all the text
map <leader><leader>y :%y+<CR>
"pick random color scheme
map <leader>rc :RandomColorScheme<CR>
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

" Remap keys for applying codeAction to the current line.
nmap <leader>k  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-sql',
  \ 'coc-prisma'
  \ ]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" Ctrl-. remap 
nnoremap <silent> <space>k  :<C-u>CocList commands<cr>

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:lightline = { 'colorscheme': 'challenger_deep'}
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Display all matching files when we tab complete
set wildmenu

if has('nvim') || has('termguicolors')
  set termguicolors
endif

colorscheme challenger_deep