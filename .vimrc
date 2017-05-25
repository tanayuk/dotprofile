set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Custom plugins
Plugin 'klen/python-mode'

" All of your Plugins must be added before the follwing line
call vundle#end()
filetype plugin indent on

" Python mode configuraiton
filetype plugin indent on
syntax on

" Syntax coloring
syntax on

" Set tab size to 2
set tabstop=2
" replace tab to spaces
set expandtab
" size of an indent
set shiftwidth=4

set background=dark
highlight Normal ctermfg=grey ctermbg=black
