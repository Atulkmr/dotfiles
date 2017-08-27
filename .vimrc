call plug#begin('~/.vim/plugged')

" Use single quotes and write Plug 'any valid git url' in this section
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tcomment_vim'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'Rip-Rip/clang_complete'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'nvie/vim-flake8'
call plug#end()

set nocompatible

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set pastetoggle=<F3> 			
set hlsearch
set mouse=a
set undolevels=1000 			" Number of undo levels
syntax enable 
set backspace=indent,eol,start
set showmatch mat=5  			" blink match parenthesis, blink match time
set so=12 						" avoid cursor getting to extreme bottom
set tm=400 						" time waited for special sequences in ms
set encoding=utf-8
set ruler cursorline
set synmaxcol=120 				"prevents syntax highlighting for long lines (performance)

set background=dark
colorscheme solarized
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============


set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set cindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab

filetype plugin on
filetype indent on

set wrap       "Wrap lines
set linebreak  "Wrap lines at convenient points

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"--------------------------------------------------MAPPINGS-----------------------------------------------------------
inoremap <leader><leader> <Esc>
nnoremap <leader><leader> i
"changes the current word to UPPERCASE when in insert mode
inoremap <C-u> <Esc><Right>viwU<Esc>viw<Esc>i
""changes the current word to UPPERCASE when in normal mode
nnoremap <C-u> viwU<Esc>viw<Esc><Esc>
"Ctrl+n to open a new buffer in current window
nnoremap <C-n>  <Esc>:w<CR><Esc>:enew<CR>
"copy code to clipboard
nnoremap yy gg"+yG
"Yank visually selected lines
vnoremap cc "+y
"paste the yanked lines
nnoremap pp "+P
"to quit vim
nnoremap qq <Esc>:q<CR>
"to write the buffer to the file
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR><Right>
"move to next buffer
nnoremap <C-j> :bn<CR>
"move to previous buffer
nnoremap <C-k> :bp<CR>
"close the current buffer / append buffer no to close  that buffer
nnoremap <C-q> :Bclose!<CR>
"toggle search highlighting
nnoremap <F4> :set hlsearch!<CR>


" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" ========================== SYNTASTIC===========================================
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}
"-------------------------------------------TCOMMENT-CONFIG-----------------------------------------------------------
inoremap <C-/> <Esc>gcc i
vnoremap <C-/> gcc
nnoremap <C-/> gcc

"-------------------------------------------CTRLP-CONFIG---------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"--------------------------------------------NERDTREE-CONFIG-----------------------------------------------------------
map <C-t> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd StdinReadPre * leDTreeAutoDeleteBuffer = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
"--------------------------------------------ULTISNIPS-CONFIG----------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"----------------------------------------------AIRLINE-CONFIG-----------------------------------------------------------
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
let g:airline_powerline_fonts = 1
