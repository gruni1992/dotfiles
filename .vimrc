let mapleader=" "
set number relativenumber
set clipboard=unnamedplus " using system clipboard
set scrolloff=5 " show a few lines of context around the cursor
set tabstop=4 shiftwidth=4 expandtab

nmap oo o<ESC>
nmap OO O<ESC>
imap ;; <ESC>A;<ESC>
imap ,, <ESC>A,<ESC>
autocmd! bufwritepost $MYVIMRC source $MYVIMRC | echom "Reloaded $NVIMRC" 
