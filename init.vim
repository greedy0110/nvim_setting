
" Put your PlugIn here.
" vim-plug Zone
" "https://github.com/junegunn/vim-plug"
call plug#begin('~/.config/nvim/plugged')

" for colorscheme
Plug 'morhetz/gruvbox'

" https://github.com/preservim/nerdtree 
Plug 'preservim/nerdtree'

" for c++ source file
" require "python3 -m pip install --user --upgrade pynvim" for using on neovim
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Code formatting (for C++)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" for cool statusline
Plug 'itchyny/lightline.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'https://tpope.io/vim/surround.git'

call plug#end()

colorscheme gruvbox

set clipboard=unnamed
set encoding=utf-8
lang en_US

set number
set smarttab
set cindent
set smartindent
set ts=4 sw=4
set expandtab

set showmatch
set ruler

set showcmd

syntax on

" for YCM
set completeopt-=preview

" for lightline
set noshowmode
" more scheme info: "https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md"
let g:lightline = { 'colorscheme': 'OldHope' }

" for practice Vim
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

map <C-n> :NERDTreeToggle<CR>

nnoremap <F8> :!g++ -o %:r.out % -std=c++11<Enter>
nnoremap <F9> :!./%:r.out
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

augroup autoformat_settings
    autocmd FileType c, cpp, javascript, arduino AutoFormatBuffer clang-format
augroup END

map <C-l> :FormatLines<Enter>
