set expandtab
set number
set relativenumber
set ts=4 sw=4
syntax on " Syntax highlighting
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set nowrap

execute pathogen#infect()
filetype plugin indent on
colorscheme dracula
nnoremap ; :
let g:dracula_colorterm = 0
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
let g:ruby_host_prog = '/usr/bin/ruby'

" File Find {{{

set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set hidden

" }}}
