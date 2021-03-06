set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Valloric/YouCompleteMe'
" End of My Plugin

call vundle#end()            " required
filetype plugin indent on    " required
set bs=2
set ts=4
set sw=4
set number
" shows row and column number at bottom right corner
set ruler


" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme desert 

" For vim-airline (status/tabline for vim)
" https://github.com/vim-airline/vim-airline
set laststatus=2
let g:airline_theme="powerlineish" 
let g:airline_powerline_fonts = 1   
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>


" NERDTree config 
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")&&b:NERDTreeType == "primary") | q | endif

