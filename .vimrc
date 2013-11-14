"""""""""""""""""""""""""""""""""""""
" Mitermayer Reis - Vim configuration
"
" mitermayer.reis@gmail.com
" ---------------------------------
" Using vundle to manage bundles.
"""""""""""""""""""""""""""""""""""""
" => Bootstrap
""""""""""""""""""""""""""""""""""""

syntax on

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on

set foldmethod=syntax


""""""""""""""""""""""""""""""""""""
" => Bundles
""""""""""""""""""""""""""""""""""""

Bundle "cakebaker/scss-syntax.vim"
Bundle "duganchen/vim-soy"
Bundle "einars/js-beautify"
Bundle "ervandew/supertab"
Bundle "flazz/vim-colorschemes"
Bundle "garbas/vim-snipmate"
Bundle "gmarik/vundle"
Bundle "majutsushi/tagbar"
Bundle "maksimr/vim-jsbeautify"
Bundle "marcWeber/vim-addon-mw-utils"
Bundle "mattn/zencoding-vim"
Bundle "pangloss/vim-javascript"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "tomtom/tlib_vim"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-surround"
Bundle "vim-scripts/JSON.vim"
Bundle 'kchmck/vim-coffee-script'

""""""""""""""""""""""""""""""""""""
" => Leader keys, color schemes
""""""""""""""""""""""""""""""""""""

let mapleader = ","
let g:EclimMakeLCD = 1
let g:EclimShowCurrentError = 1
let g:mapleader = ","
let g:user_zen_leader_key = '<c-k>'

colorscheme 256-jungle

""""""""""""""""""""""""""""""""""""
" => Keys shortcuts mapping
""""""""""""""""""""""""""""""""""""

" => Toggle tags
map <F2> :TagbarToggle<CR>

" => Toggle file tree
map <F3> :NERDTreeToggle <CR>

" => Toggle buffers
map <F4> :BuffersToggle <CR>

" => Allow to paste without auto indent
se pastetoggle=<F5>

" => Create javascript tags
map <silent> <F7>
    \ :!jsctags .<CR>

" => Create java tags
map <silent> <F8>
    \ :!ctags -R
    \ --languages=php .<CR>

" => locate file
map <F9> :LocateFile  <CR>

" => removed unused imports
map <F10> :JavaImportOrganize  <CR>

""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""

set autoread
set backspace=indent,eol,start
set history=1000
set noerrorbells
set number
set scrolloff=5

set hlsearch
set ignorecase
set incsearch
set mat=2
set ruler
set showmatch

set nobackup
set noswapfile
set nowb

set tags=~/tags,./tags,tags;

""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""

set ai "Auto indent
set expandtab
set lbr
set shiftwidth=4
set si "Smart indet
set smarttab
set tabstop=4
set tw=500
set wrap "Wrap lines

""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""

set hlsearch
set ignorecase
set incsearch
set mat=2
set nobackup
set noswapfile
set nowb
set ruler
set showmatch

""""""""""""""""""""""""""""""""""""
" => Filetype specifics
""""""""""""""""""""""""""""""""""""

" Unfold when opening files
au BufWinEnter * normal zR

" Removes whitespace when saving the file
au BufWritePre * :%s/\s\+$//e

" => Python
au FileType python compiler pylint
au BufWritePre *.py normal m`:%s/\s\+$//e ``
au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print

" => Scss, Less, soy
au BufRead,BufNewFile *.scss set filetype=scss
au BufNewFile,BufRead *.less set filetype=scss
au BufNewFile,BufRead *.soy set filetype=soy

" => Html, Xml
au FileType html,xhtml,xml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>

" => css
au FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" => Javascript
map <c-f> :call JsBeautify()<cr>
au FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>

" for css or scss

" => Java auto complete with eclim
au FileType java compiler javac
au FileType java set makeprg=mvn\ compile
au FileType java set errorformat=\[ERROR]\ %f:%l:\ %m,%-G%.%#

" Import the class under the cursor
au FileType java nnoremap <silent> <buffer> <leader>i :JavaImport<cr>

" Search for the javadocs of the element under the cursor
au FileType java nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>

" Perform a context sensitive search of the element under the cursor
au FileType java nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

" Download sources and create tags file
au FileType java map <silent> <F8>
    \ :ProjectLCD <CR>
    \ :!mvn dependency:unpack-dependencies -Dclassifier=sources -Dmdep.failOnMissingClassifierArtifact=false;
    \ mvn eclipse:eclipse;
    \ ctags -R --languages=java .; <CR>

""""""""""""""""""""""""""""""""""""
