"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" http://amix.dk/vim/vimrc.html
syntax on

filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

set history=200
set autoread " Watch files changes		
set number " Add lines	
set scrolloff=5 " keep at least 5 lines above/below
set backspace=indent,eol,start
set noerrorbells
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pluggins
"Nertree plgguin
map <F3> :NERDTreeToggle <CR>
map <F2> :TlistToggle <CR>
se pastetoggle=<F5>
let g:user_zen_leader_key = '<c-k>'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set lbr
set tw=500
set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler "Always show current position
set ignorecase "Ignore case when searching
set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set showmatch
set mat=2
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile
set tags=~/tags
" This is the file specific changes
"-------------------------------------------------------------------------------
" PYTHON 
autocmd FileType python compiler pylint
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class 
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au BufNewFile,BufRead *.less set filetype=css
" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" X?HTML & XML
autocmd FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
" CSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" *****************************************************************************
