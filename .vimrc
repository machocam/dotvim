set nocompatible              " required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"---------------PLUGINS BITCHES!!!-----------

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold' "Folds happen at indent by default - this makes it retty
Plugin 'vim-scripts/indentpython.vim' "automatic indent for .py 
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'scrooloose/nerdtree' added this in case I don't like tabs
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"----------------------------------------------
"UTF8 spport 
set encoding=utf-8

"Sets the direction that the plit command works in
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"View docstrings for folded code
let g:Simplyfold_docstring_preview=1

"Adds PEP8 indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

"Adds indent settings etc. for other files types than .py
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2 
    \ set shiftwidth=2

"Flag trailing whitespaces 
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Hybrid line numbering
set relativenumber 
set number

"Somme extra settings for the YouCompleteMe plugin 
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"----------MAKE THINGS LOOK PRETTY-------------

"Make python look pretty :) 
let python_highlight_all=1
syntax on 

"Logic for colour scheme based on use
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

"Change between solarized dark and light
call togglebg#map("<F5>")

"----------------------------------
"----------FILE BROWSING-----------

"ignore .pyc files in nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']


