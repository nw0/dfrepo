filetype off
syntax on
" To load plugins correctly
filetype plugin indent on

" security
set nomodeline

set ttyfast

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set wrap

set title
set bg=dark

set number
set printoptions=number:y
set relativenumber
" Highlight the current line
set cursorline
hi CursorLine       cterm=NONE ctermbg=237
" Bold the line number, not underline
hi CursorLineNr     cterm=NONE ctermfg=11 ctermbg=237
" De-emphasise the other line numbers
hi LineNr           ctermfg=245

set colorcolumn=80
hi ColorColumn      ctermbg=237

" Retain at least 2 context lines
set scrolloff=2

set incsearch
set hlsearch

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Settings for specific file types
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab autoindent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
