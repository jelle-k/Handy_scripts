" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

Plug 'nvie/vim-flake8'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'danilo-augusto/vim-afterglow',{'as':'afterglow'}
Plug 'dikiaap/minimalist'
Plug 'davidhalter/jedi-vim'



" for fonts
" check here, don't add to this file, follow instructions.
" https://github.com/be5invis/Iosevka

" Initialize plugin system
call plug#end()

filetype plugin indent on	      " required

syntax enable
set tabstop=4                   " number of visual spaces in TAB
set softtabstop=0               " Sets the number of columns for a TAB
set shiftwidth=4                " number of space characters inserted for indentation
set noexpandtab                   " TABs are spaces
set number                      " show line numbers
set showcmd                     " show command in bottom bar
set cursorline                  " highlight current line
filetype indent on              " load filetype-specific indent files
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " hightlight matching [{()}]
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
set autochdir                   " Automatically change the current directory
set laststatus=2								" window will always have a status line


" jk is escape
inoremap jk <esc>

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Jedi-Vim settings
let g:jedi#popup_select_first = 0

set t_Co=256                    " terminal colour

color dracula


