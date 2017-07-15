call plug#begin('~/.vim/plugged')

" Use single quotes and write Plug 'any valid git url' in this section
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
Plug 'altercation/vim-colors-solarized'
Plug 'nvie/vim-flake8'
call plug#end()

set number 		"This turns on line numbers
set autoindent
set cindent
set smartindent
set smarttab
set pastetoggle=<F3> 
set shiftwidth=4 tabstop=8 softtabstop=4 expandtab
set hlsearch
set mouse=a
filetype plugin indent on
syntax enable 
set backspace=indent,eol,start
set wrap 		" enable word wrap
set showmatch mat=5  " blink match parenthesis, blink match time
set so=12 		" avoid cursor getting to extreme bottom
set tm=400 		" time waited for special sequences in ms
set encoding=utf-8
set ruler cursorline
set synmaxcol=120 	"prevents syntax highlighting for long lines (performance)
set nobackup nowb noswapfile " disable extra files created by vim
set background=dark
colorscheme solarized
let mapleader = ','

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
"--------------------------------------------ULTISNIPS-CONFIG----------------------------------------------------------
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"----------------------------------------------AIRLINE-CONFIG-----------------------------------------------------------
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
let g:airline_powerline_fonts = 1
