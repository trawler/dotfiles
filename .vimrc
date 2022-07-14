set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'jonstoler/werewolf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader = "#"
let maplocalleader = "#"
set nocp
set ignorecase
set smartcase
syntax on
set hlsearch
set cursorline
set ruler

colorscheme industry
" colorscheme antarctic

" let g:werewolf_day_themes = ['antarctic']
" let g:werewolf_night_themes = ['industry']

" default 8, use 24 hour format
" let g:werewolf_day_start = 8

" default 20, 24 hour format
" let g:werewolf_day_end = 20
"

"set mouse=a

"imap jj <Esc>

" Add recently accessed projects menu (project plugin)
set viminfo^=!

if &diff
  set t_Co=256
  "colorscheme peaksea
  colorscheme evening
endif

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" bash style completion
set wildmode=longest,list,full
set wildmenu

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

set cf  " Enable error files & error jumping.

set history=256  " Number of things to remember in history.

set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

" Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
"set cinoptions=:0,p0,t0
"set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab


" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
" set list

" Show $ at end of line and trailing space as ~
" Show line numbers
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set nu
let b:lv_enabled=1
" Enable/Disable this if necessary
nnoremap <C-M> :Lineview<CR>
command -bar Lineview call ToggleLineview()
function ToggleLineview()
  if !exists("b:lv_enabled") || !b:lv_enabled
    set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
    set nu
    let b:lv_enabled=1
  else
    set lcs=""
    set nonu
    let b:lv_enabled=0
  end
endfunction

set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" XML-Plugin Options
" be xthml compliant
let xml_use_xhtml = 1


nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

call pathogen#infect()
call pathogen#helptags()

" vim -b : edit binary using xxd-format!
"augroup Binary
"  au!
"  au BufReadPre  *.bin let &bin=1
"  au BufReadPost *.bin if &bin | %!xxd
"  au BufReadPost *.bin set ft=xxd | endif
"  au BufWritePre *.bin if &bin | %!xxd -r
"  au BufWritePre *.bin endif
"  au BufWritePost *.bin if &bin | %!xxd
"  au BufWritePost *.bin set nomod | endif
"augroup END



" für sehr große Dateien
"let g:SaveUndoLevels = &undolevels
"let g:BufSizeThreshold = 1000000
"if has("autocmd")
"  " Store preferred undo levels
"  au VimEnter * let g:SaveUndoLevels = &undolevels
"  " Don't use a swap file for big files
"  au BufReadPre * if getfsize(expand(<afile>)) >= g:BufSizeThreshold | setlocal noswapfile | endif
"  " Upon entering a buffer, set or restore the number of undo levels
"  au BufEnter * if getfsize(expand(<afile>)) < g:BufSizeThreshold | let &undolevels=g:SaveUndoLevels | hi Cursor term=reverse ctermbg=black guibg=black | else | set undolevels=-1 | hi Cursor term=underline ctermbg=red guibg=red | endif
"endif

set background=dark
set wildmode=longest,list,full
set wildmenu

call plug#begin()

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'liuchengxu/vim-clap'

" The bang version will try to download the prebuilt binary if cargo does not exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" Initialize plugin system
call plug#end()



