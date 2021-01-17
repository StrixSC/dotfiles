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

" disable stupid exmode
:map Q <Nop>

" map leader is a space in this case
let mapleader = " "

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

Plug 'leafgarland/typescript-vim'
Plug 'dylnmc/novum.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'neoclide/coc.nvim', {'branch' : 'release'}
"use :CocDiagnostics to see list of errors
"and :CocConfig to see config options
"Prettier by default will run on auto save but can also be manually triggered by:
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p :Prettier<CR>
"go to definition
nmap <leader>gd <Plug>(coc-definition)
"list all references
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :Files<CR>

"View and search LSP symbols, tags in Vim/NeoVim.
"https://github.com/liuchengxu/vista.vim
" Opens a window with all the variables and functions
Plug 'liuchengxu/vista.vim'
"sets coc.nvim as default Vista
let g:vista_default_executive = 'coc'
"shortcut to toggle Vista
nmap <leader>vv :Vista!!<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

"Rooter changes the working directory to the project root when you open a file or directory.
" You can turn this off (see below) and use the :Rooter command to invoke Rooter manually.
" When Rooter changes the working directory it emits the autocmd user event RooterChDir.
Plug 'airblade/vim-rooter'
"To make Rooter start in manual mode:
let g:rooter_manual_only = 1

Plug 'christoomey/vim-tmux-navigator'
"Easy switching between buffers - vim-airline will show buffer at the top
"unless multiple tabs are open
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" show folder and file name in smarter tab line (top buffers)
let g:airline#extensions#tabline#formatter = 'short_path'

"https://github.com/jaxbot/semantic-highlight.vim"
"Where every variable is a different color, an idea popularized by Evan Brooks
"blog post.
"https://medium.com/@evnbr/coding-in-color-3a6db2743a1e
"Plug jaxbot/semantic-highlight.vim'
"noremap <Leader>s :SemanticHighlightToggle<cr>

":CocInstall coc-explorer
" Explorer
"nmap <C-n> :CocCommand explorer<CR>
"close the coc-explorer tree if buffers are open
"autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"use tab to open different options for the tree

""A fancy start screen for Vim.
" Also can save sessions
" :h SSave to see help screen
" sessions get stored into:
" Vim (Unix):    `$HOME/.vim/session`
" :SLoad       load a session
" :SSave[!]    save a session
" :SDelete[!]  delete a session
" :SClose      close a session
" If ! is given, you won't get prompted.
Plug 'mhinz/vim-startify'

""Vim Better Whitespace Plug
"":ToggleWhitespace
"":StripWhitespace
Plug 'ntpeters/vim-better-whitespace'

"Automatic close for common block and scope identifiers such as brackets
" parentheses, brace, squares
"https://github.com/jiangmiao/auto-pairs
"Something I’ve found to be very useful,
"which doesn’t require any bundles other than deliitMate really,
"is to add a key binding that will split my current line.
" So if I type {, delimitMate will insert } after my cursor,
" then I can execute my binding that will insert a new line in
" the middle of the two ready to receive some code.
Plug 'Raimondi/delimitMate'
"Just hit control C and it will move the closing bracket down
"<C-g>g mapping. CTRL+g g will put you after the matching bracket

" :GitLog
Plug 'kablamo/vim-git-log'

" Install fonts for vim-devicons from https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'

" Easily interact with tmux from vim
Plug 'benmills/vimux'
" Prompt for a command to run in another pane
map <Leader><Leader>p  :VimuxPromptCommand<CR>
" rerun previous command
map <Leader><Leader>r :VimuxRunLastCommand<CR>
"Show which line changed since your last commit.
"GitGutterToggle
Plug 'airblade/vim-gitgutter'
"For commenting and uncommenting blocks of line

Plug 'preservim/nerdtree'

" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'
" [count]<leader>cc |NERDCommenterComment|
" Comment out the current line or text selected in visual mode.
" [count]<leader>cu |NERDCommenterUncomment|
" Uncomments the selected line(s).
" [count]<leader>cs |NERDCommenterSexy|
" Comments out the selected lines with a pretty block formatted layout.


"random colorscheme picker - picks automatically
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'
"If you set this variable to 1 (true) and cycle to the next/previous color scheme,
"the plug-in will skip color schemes with a different ['background'] bg.
"By default this is set to 0 (false).
let g:colorscheme_switcher_keep_background=1


" silver surfer search text ack bundle
"Plug 'ggreer/the_silver_searcher'
"run pacman -S the_silver_searcher if not installed

Plug 'rking/ag.vim'

" bind shift KK to grep word under cursor
" Use Ag instead of grep (more advanced')
nnoremap KK :Ag <C-R><C-W><CR>

" Debugger
"https://github.com/puremourning/vimspector
Plug 'puremourning/vimspector'
"Configure vimspector in your .vimrc, for example to enable the standard mapings:
let g:vimspector_enable_mappings = 'HUMAN'

"vimspector shortcuts
nmap <leader><leader>1 :call vimspector#Launch()<CR>
nmap <leader><leader>2 :VimspectorReset
nmap <leader><leader>3 :VimspectorEval
nmap <leader><leader>4 :VimspectorWatch
nmap <leader><leader>5 <Plug>VimspectorToggleBreakpoint
nmap <leader><leader>6 <Plug>VimspectorContinue
nmap <leader><leader>7 <Plug>VimspectorStepOver
nmap <leader><leader>8 <Plug>VimspectorStepInto
nmap <leader><leader>9 <Plug>VimspectorStepOut

"Colorschemes
"vim-auora
Plug 'rafalbromirski/vim-aurora'

"vim-synthwave84 colorscheme
Plug 'artanikin/vim-synthwave84'

"vim horizon synthwave colorscheme
Plug 'ntk148v/vim-horizon'

"vim snazzy bright colors colorscheme
Plug 'connorholyday/vim-snazzy'

"src Dark colorscheme
Plug 'srcery-colors/srcery-vim'

"cobatl2 colorscheme
Plug 'herrbischoff/cobalt2.vim'

" candycode
Plug 'vim-scripts/candycode.vim'

" colorscheme meta5
Plug 'christophermca/meta5'

" colorscheme ayu mirage
Plug 'ayu-theme/ayu-vim' " or other package manager
let ayucolor="mirage" " for mirage version of theme

"colorscheme lucius2
Plug 'maksimr/Lucius2'

"busybee colorscheme
Plug 'vim-scripts/BusyBee'

"nightowl theme
Plug 'haishanh/night-owl.vim'

"wimstefan/vim-artesanal colorscheme
Plug 'wimstefan/vim-artesanal'

"Purify colorscheme
Plug 'kyoz/purify', { 'rtp': 'vim' }

"moonfly
Plug 'bluz71/vim-moonfly-colors'

"badwolf
Plug 'leafgarland/badwolf'

"seti colorscheme"
Plug 'trusktr/seti.vim'

"oceanic-next
Plug 'mhartington/oceanic-next'

"one dark pro
Plug 'joshdick/onedark.vim'

"molokayo
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
let g:molokayo#high_contrast#comments = 1

" neon colorscheme - cyberpunk type of theme with neon lights
Plug 'yuratomo/neon.vim'

"Xcode colorscheme
Plug 'arzg/vim-colors-xcode'

"vim-wtf theme
Plug 'sstallion/vim-wtf'

"Dark colorscheme
Plug 'Lokaltog/vim-distinguished'

"JellyBeans
Plug 'nanotech/jellybeans.vim'

"Tender colorscheme
Plug 'jacoborus/tender.vim'

"Sonokai colorscheme
Plug 'sainnhe/sonokai'

"Tokyonight theme
Plug 'ghifarit53/tokyonight-vim'

"Gruvbox
Plug 'lifepillar/vim-gruvbox8'

"Dracula
Plug 'dracula/vim', { 'as': 'dracula' }

"https://github.com/humanoid-colors/vim-humanoid-colorscheme
Plug 'humanoid-colors/vim-humanoid-colorscheme'

" RainGlow Package
" 320+ color themes
Plug 'rainglow/vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme codedark

autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * highlight LineNr ctermfg=NONE ctermbg=NONE

map <silent> <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=0

filetype plugin on

" enter the current millenium
set nocompatible

" enable syntax and plugins
syntax enable
filetype plugin on

set formatoptions-=r " don't auto insert comment leader on enter in insert
set formatoptions-=o " don't auto insert comment leader on o/O in normal mode
set formatoptions-=c " don't auto-wrap comments using textwidth, inserting the current comment leader automatically

" show numbers
set number
set relativenumber

" 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set ignorecase

" removes newline EOL
" so other non vim/terminal editors don't see extra line
set binary
set noeol

"spaces instead of tab, must be after binary and noel setting
set expandtab

"I really get frustrated with tabs that look like white spaces,
"so I ensure they are visible by telling Vim to show all tabs
"as little arrows ▷.
"This line also ensures that end of lines are shown with a negation sign ¬ :
"highlight tabs and trailing spaces
" turn on with   -> set list
" turn off with  -> set nolist
"set nolist
"set listchars=eol:¬,tab:▷\ ,
set listchars=tab:▷\ ,
set list

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

"Switch between different backgrounds
set background=dark
"set background=light

"Sometimes it is helpful if your working directory
"is always the same as the file you are editing.
"To achieve this, put the following in your vimrc:
"set autochdir

" yy will not just use internal vim buffer but will also copy
" into OS's clipboard
set clipboard=unnamed
" Allow mouse to scroll the vim windows and resize splits
set mouse=a

"colorscheme onedark
"colorscheme banner
"colorscheme badwolf
"colorscheme srcery
"colorscheme candycode
"colorscheme meta5
"colorscheme purify
"colorscheme snazzy
"colorscheme moonfly
"colorscheme synthwave84
"colorscheme molokayo
"colorscheme neon2
"colorscheme neon
"colorscheme darkside
"colorscheme seti
"colorscheme shrek
"colorscheme horizon
"colorscheme downpour
"colorscheme default
colorscheme novum
"If all that is wanted is to display the name of the current file,
"type Ctrl-G (or press 1 then Ctrl-G for the full path).
" put full path of current dir into vim file
noremap <leader><leader>dw :r! echo %:p<CR>

"format to get rid o
noremap <leader><leader>f :e ++ff=dos<CR>

"" toggle line numbers
noremap <leader><leader>ln :set rnu!<CR>

" Easier buffer switching
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8
set fileencoding=utf8

" While typing a search command, show where the pattern,
" as it was typed so far, matches.
set incsearch

"space space y will copy all the text
map <Leader><Leader>y :%y+<CR>

function TurnOnCustomSettings()
  "search
  :hi Search term=reverse cterm=underline ctermfg=201 ctermbg=11 gui=underline guifg=#ff00ff guibg=302028

  "functions
  :hi Function cterm=bold,italic gui=bold,italic ctermfg=75 
  :hi JavaScriptFunction cterm=bold,italic gui=bold,italic ctermfg=75 
  ":hi jsBlock cterm=bold,italic gui=bold,italic
  :hi jsIdentifier cterm=bold,italic gui=bold,italic ctermfg=75 

  "javaScript classes etc
  :hi JavaScriptReserved term=underline cterm=italic ctermfg=84 gui=italic 
  "make background transparent
  :hi Normal guibg=NONE ctermbg=NONE
  :hi clear Normal

  "overwites the non text background
  "":hi NonText guibg=NONE ctermbg=NONE
  "":hi EndOfBuffer guibg=NONE ctermbg=NONE
  :hi clear NonText
  :hi clear EndOfBuffer

  "clear line
  :hi clear SignColumn
  :hi clear LineNr
  :hi clear CursorLineNr
  :hi clear CursorLine

  :hi clear GitGutterAdd
  :hi clear GitGutterChange
  :hi clear GitGutterDelete

  " make javascript braces bold
  :hi javaScriptBraces cterm=bold gui=bold guifg=#f2f3f4
  :set formatoptions-=r "don't auto insert comment leader on enter in insert
  :set formatoptions-=o "don't auto insert comment leader on o/O in normal mode
  :set formatoptions-=c "don't auto-wrap comments using textwidth

endfunction
map <leader>ts :exec TurnOnCustomSettings()<cr>

function ClearSignColumn()
  "clear line
  :hi clear SignColumn
  :hi clear LineNr
  :hi clear GitGutterAdd
  :hi clear GitGutterChange
  :hi clear GitGutterDelete
  ":hi clear CursorLineNr
  ":hi clear CursorLine
endfunction

map <leader><leader>cs :exec ClearSignColumn()<cr>

"make comments Italic
function MakeItalic()
  :hi Comment cterm=italic gui=italic
endfunction
map <Leader>mi :exec MakeItalic()<CR>

"turns on my own highlight colors for comments only
function GreenComments()
  " comments
  :hi JavaScriptLineComment guifg=#7ea869 cterm=italic gui=italic
  :hi JavaScriptComment guifg=#7ea869 cterm=italic gui=italic
  :hi Comment guifg=#7ea869 cterm=italic gui=italic
  :hi cComment guifg=#7ea869 cterm=italic gui=italic
  :hi cCommentL guifg=#7ea869 cterm=italic gui=italic
endfunction
map <Leader>gc :exec GreenComments()<CR>

"turns on my own highlight colors for comments only
function BlueComments()
  " comments
  :hi JavaScriptLineComment guifg=#80a0ff cterm=italic gui=italic
  :hi JavaScriptComment guifg=#80a0ff cterm=italic gui=italic
  :hi Comment guifg=#80a0ff cterm=italic gui=italic
  :hi cComment guifg=#80a0ff cterm=italic gui=italic
  :hi cCommentL guifg=#80a0ff cterm=italic gui=italic
endfunction
map <Leader>bc :exec BlueComments()<CR>
" This function will show what groups are being applied.
" Add to your ~/.vimrc, place your cursor over the item in question, and press <leader>sp to output the groups.
" https://jordanelver.co.uk/blog/2015/05/27/working-with-vim-colorschemes/
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>sp :call <SID>SynStack()<CR>

"pick random color scheme
map <Leader>rc :RandomColorScheme<CR>

"compiling and running c++ files
"autocmd filetype cpp nnoremap <leader><leader>4 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++11 -O2 % -o %:r && ./%:r <CR>
"autocmd filetype cpp nnoremap <leader><leader>5 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++11 -O2 % -o %:r && ./%:r < ./input.txt<CR>
"c++2a - working draft for ISO C++ 2020 standard
"
"-g is debug mode
"-O0 optimization for compilation time (default)
"-O2 optimization more for code size and execution time
autocmd filetype cpp nnoremap <leader><leader>0 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++2a -g -O2 % -o %:r && ./%:r <CR>
autocmd filetype cpp nnoremap <leader><leader>00 :w <bar> !clear && g++ -Wall -Wno-unused-result -std=c++2a -g -O2 % -o %:r && ./%:r < ./input.txt<CR>


"" FOLDING:
""set foldmethod=syntax
""set foldmethod=manual
"set foldmethod=indent
"set foldlevelstart=1
"set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=2         "this is just what i use

"" zf to create a fold
"" zm to close fold level by level
"" zr open fold level by level
"" za to toggle open and close of a fold (don't need to use zc or zo)
"" zR open ALL folds

"" zc to close a fold
"" zo open a fold

""close all folds with zM (not really needed?)
"" The easiest way to disable (and enable) folding on the fly is zi.
"" zi is the normal mode command that toggles 'foldenable',
"" just like :set foldenable!.
"" Mnemonic: "fold invert". See :h zi.

""put away .swp files into home dir instead of cluttering up in your projects
"" Don't forget to create this directory
"set swapfile
"set dir=~/tmp/

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

"---------------------
" run it on vim start
" --------------------
autocmd VimEnter * RandomColorScheme

"automatically clearn signcolumn
autocmd VimEnter * hi clear SignColumn

"overwites the non text background
autocmd VimEnter * hi clear NonText
autocmd VimEnter * hi clear EndOfBuffer
autocmd VimEnter * hi clear Special
autocmd VimEnter * hi clear LineNr

"make background of any theme black
map <Leader>mb :hi Normal guibg=black guifg=white<CR>
"make background clear
map <leader>mc :hi clear Normal<CR>

if exists('$TMUX')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"++++++++++++++++++++++++++++
"  custom highlights below
"++++++++++++++++++++++++++++
" Enable italics for themes
let g:onedark_terminal_italics=1
let g:gruvbox_italic=1
let g:two_firewatch_italics=1
let g:dracula_italic=1
let g:dracula_bold=1
let g:enable_bold_font = 1
let g:one_allow_italics = 1 " I love italic for comments
let g:enable_italic_font = 1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" Overwrite colors and font style
"green comments
"hi Comment guifg=#7ea869 ctermfg=green cterm=italic gui=italic
"hi JavaScriptLineComment guifg=#7ea869 ctermfg=green cterm=italic gui=italic"Enable HTML attributes to be italic

highlight htmlArg cterm=italic gui=italic

"Enable HTML italic highlight
highlight htmlItalic cterm=italic gui=italic

"make background of any theme black
"highlight Normal guibg=black guifg=white
"hi clear Normal

"overwites the non text background
"hi NonText guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE
hi clear NonText
hi clear EndOfBuffer

" clears Special keyword highlight
" and sets it to custom light blue color
hi clear Special

"clear sign column and line background
hi clear SignColumn
hi clear LineNrm