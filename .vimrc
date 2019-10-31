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
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
