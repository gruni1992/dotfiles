let mapleader=" "
set number relativenumber
set clipboard=unnamed " using system clipboard
set scrolloff=5 " show a few lines of context around the cursor
set tabstop=4 shiftwidth=4 expandtab

nmap oo o<ESC>
nmap OO O<ESC>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

vnoremap p "_dP
