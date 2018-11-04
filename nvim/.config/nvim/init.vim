call plug#begin(expand('~/.config/nvim/plug/'))

" Language support
Plug 'rust-lang/rust.vim'
Plug 'pearofducks/ansible-vim'
Plug 'guns/vim-clojure-static'
Plug 'JulesWang/css.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tpope/vim-git'
Plug 'othree/html5.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'sheerun/vim-json'
Plug 'nginx/nginx', {'rtp': 'contrib/vim'}
Plug 'mitsuhiko/vim-python-combined'
Plug 'kurayama/systemd-vim-syntax'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'Firef0x/PKGBUILD.vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/JavaDecompiler.vim'
Plug 'hashivim/vim-terraform'

" Looks
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'

" Functionality
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Valloric/MatchTagAlways'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/taglist.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'chrisbra/SudoEdit.vim'
Plug 'godlygeek/tabular'
Plug 'Chiel92/vim-autoformat'
Plug 'metakirby5/codi.vim'
Plug 'bronson/vim-visual-star-search'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

" basics
let mapleader = ","     " map leader to ,
set mouse=a             " make sure mouse is used in all cases.
set termguicolors       " true color
colorscheme Monokai     " define syntax color scheme
set background=dark
set shortmess+=I        " disable the welcome screen
set clipboard+=unnamedplus " yank and copy to X clipboard
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set ruler               " ruler display in status line
set hidden              " enable buffer switching without saving
set showmode            " show mode at bottom of screen
set showcmd             " show incomplete command at bottom of screen
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set cmdheight=1         " set the command height
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
set mat=5               " show matching brackets for 0.5 seconds
set scrolloff=5         " keep 2 lines spacing between cursor and edge
set number              " show line numbers
syntax on               " enable syntax highlighting
filetype plugin indent on
set cursorline
set cursorcolumn
map ; :
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set smarttab            " remember indent
set wildmenu
set wildmode=list:longest,full
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search
nnoremap <leader><space> :nohlsearch<CR>  " turn off search highlight


" vim airline
let g:airline#extensions#tabline#enabled = 1


" nvim terminal binds
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Always enter terminal in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert

" vim-autoformat
noremap <Leader>f :Autoformat<CR>

let g:ctrlp_user_command = 'rg %s --files -i --color=never --glob ''!.git'' --glob ''!.DS_Store'' --glob ''!node_modules'' --no-messages --hidden -g ""'
let g:ctrlp_extensions = ['funky']


nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1

nmap <C-k> <Plug>CtrlSFPrompt

" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>


let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
nnoremap <C-s> :call LanguageClient_contextMenu()<CR>
