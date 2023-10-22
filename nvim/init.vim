" " " " " " " 
" Minimal nvim Config
"
" drjchris 2023


let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" auto closes stuff
Plug 'Townk/vim-autoclose'

" theme
Plug 'rebelot/kanagawa.nvim'

call plug#end()

" Color Theme
colorscheme kanagawa

" show cursor line
set cursorline

" show line numbers
set number

" Sortout the tab stuff
set tabstop=4
set shiftwidth=4
set shiftwidth=4
set expandtab

" fix hilight
set nohlsearch

" copy to clipboard
set clipboard=unnamedplus

" remove text wrap
set nowrap

" lines always visible
set scrolloff=5

" highlight current row and change background color
highlight CursorLine guibg=#101018

" make command line only one row high
set cmdheight&
