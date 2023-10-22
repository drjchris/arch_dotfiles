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

" Sortout the tab stuff
set number
set tabstop=4
set shiftwidth=4
set shiftwidth=4
set expandtab

