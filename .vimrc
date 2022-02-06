set nocompatible              " required
filetype off                  " required
set encoding=utf-8
set guifont=DroidSansMono\ Nerd\ Font\ 11
set nu
set clipboard=unnamed

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'fatih/vim-go'
" Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'google/yapf', { 'rtp': 'plugins/vim' }
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
" Plugin 'wakatime/vim-wakatime'
Plugin 'frazrepo/vim-rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'

let python_highlight_all=1
let g:rainbow_active = 1
syntax on

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set splitbelow
set splitright

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nerdtree seting
map <F2> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za


let g:SimpylFold_docstring_preview=1

highlight BadWhitespace ctermbg=red guibg=darkred
au BufNewFile,BufRead *.py,*.html
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

highlight BadWhitespace ctermbg=red guibg=darkred
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
