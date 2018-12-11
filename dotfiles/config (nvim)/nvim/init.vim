" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'baskerville/bubblegum'
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'danilo-augusto/vim-afterglow',{'as':'afterglow'}
Plug 'dikiaap/minimalist'
Plug 'python-mode/python-mode', { 'branch': 'develop'  }

" Initialize plugin system
call plug#end()

filetype plugin indent on	" required

syntax enable
set tabstop=1                   " number of visual spaces in tab
set softtabstop=1               " numbers of spaces in tab when e
set shiftwidth=1
" set expandtab                   " tabs are spaces
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
let g:airline_theme='dracula'

let g:pymode_python = 'python3'

set t_Co=256                    " terminal colour

color dracula
