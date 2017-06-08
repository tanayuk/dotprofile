set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Custom plugins
" Python related plugins
Plugin 'klen/python-mode'

" Markdown related plugins
" tabular must come before vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'

" Jedi (Auto-completion for Python)
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the follwing line
call vundle#end()
filetype plugin indent on

" Python mode configuraiton
let g:pymode_options_colorcolumn = 0
filetype plugin indent on
syntax on

" vim markdown settings
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_new_list_item_indent = 2
let vim_markdown_preview_github=1


" Set tab size to 2
set tabstop=2
" replace tab to spaces
set expandtab
" size of an indent
set shiftwidth=4

set background=dark
highlight Normal ctermfg=grey ctermbg=black
