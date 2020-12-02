filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>' use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab
set autoindent
set smartindent
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
