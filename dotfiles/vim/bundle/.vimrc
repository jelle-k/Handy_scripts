set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe' 
Plugin 'nvie/vim-flake8'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sjl/badwolf'
Plugin 'sjl/gundo.vim'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable  
set tabstop=2                   " number of visual spaces in tab
set softtabstop=4               " numbers of spaces in tab when e
set expandtab                   " tabs are spaces               
set number                      " show line numbers
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
filetype indent on              " load filetype-specific indent files
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " hightlight matching [{()}]
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
" jk is escape
inoremap jk <esc>                

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='simple'

set t_Co=256                    " terminal colour
colorscheme badwolf             " theme badwolf

" JAVA
set autoindent
set si
let java_comment_string=1
let java_highlight_java_lang_ids=1
