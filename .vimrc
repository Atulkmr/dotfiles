call plug#begin('~/.vim/plugged')

" Use single quotes and write Plug 'any valid git url' in this section
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'nvie/vim-flake8'
Plug 'Valloric/MatchTagAlways'
Plug 'kshenoy/vim-signature'
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
set foldcolumn=4                "Leaves 4 columns blank for denoting fold boundaries and status.
set foldmethod=indent           "using indentation to create folds for all filetypes
set foldlevel=1			"folds will be created for shiftwidth>=1
set pastetoggle=<F3>
set hlsearch
set iskeyword&			" enables word and WORD command differentiation 
" set mouse=a
set undolevels=1000 		" Number of undo levels
syntax enable
set backspace=indent,eol,start
set showmatch mat=5  		" blink match parenthesis, blink match time
set so=12 						" avoid cursor getting to extreme bottom
set tm=400  			" time waited for special sequences in ms
set encoding=utf-8
set ruler cursorline
set synmaxcol=120       	"prevents syntax highlighting for long lines (performance)
autocmd BufNewFile *.cpp -r ~/.template.cpp  "Open new cpp file with the given template
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

" set cindent
set smartindent
set smarttab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set textwidth=120
" set expandtab
set autoindent
set fileformat=unix


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

" =================== Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"==================== Mappings ============================
inoremap <leader><leader> <Esc>
nnoremap <leader><leader> i
"Ctrl+n to open a new buffer in current window
nnoremap yy gg"+yG
"Yank visually selected lines
vnoremap yy "+y
"paste the yanked lines
nnoremap pp "+P
"to quit vim
noremap <C-n> <Esc>:enew<CR>
nnoremap qq <Esc>:q!<CR>
"to write the buffer to the file
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR><Right>
"close the current buffer / append buffer no to close  that buffer
nnoremap <C-q> :Bclose!<CR>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bprev<Cr>
"toggle search highlighting
noremap <F2> :set hlsearch!<CR>

"========================== git-gutter ======================================
set updatetime=250
"=========================== Auto-Pairs =====================================
let g:AutoPairsMapCR = 0
imap <silent><CR> <CR><Plug>AutoPairsReturn

" ========================== SYNTASTIC========================================
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"show the error list automatically
let g:syntastic_auto_loc_list=1
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

"========================= NERDcomment-config ======================
let g:NERDSpaceDelims = 1               " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1           " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'         " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1         " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting
let g:NERDCreateDefaultMappings = 0     " disable default mappings for NERDcomment

nnoremap cc :call NERDComment(0,"toggle")<CR>
vnoremap cc :call NERDComment(0,"toggle")<CR>

"========================== CTRLP-CONFIG =======================
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"==================NERDTREE-CONFIG==============================

map <C-t> :NERDTreeToggle<CR>
" Autoload NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Auto close NERDTree if no more files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"================ULTISNIPS-CONFIG=================================
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"===================AIRLINE-CONFIG================================
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
let g:airline_powerline_fonts = 1
