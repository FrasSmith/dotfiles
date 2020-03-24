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
set background=dark
colorscheme palenight
nnoremap ; :
let g:lightline = { 'colorscheme': 'palenight' }

