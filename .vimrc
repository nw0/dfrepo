syntax on
set number
set relativenumber
set title

filetype off
syntax on
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set colorcolumn=80
set wrap
set bg=dark


set scrolloff=1

set incsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
