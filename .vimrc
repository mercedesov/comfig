set nocompatible
set encoding=utf-8
set mouse=a
set clipboard=unnamedplus
set hidden
set updatetime=300
set timeoutlen=500

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

set number
set relativenumber

set ignorecase
set smartcase
set incsearch
set hlsearch

set wrap
set linebreak
set scrolloff=6
set sidescrolloff=6
set showcmd
set showmode
set ruler
set wildmenu
set wildmode=longest:full,full

set noswapfile
set nobackup
set nowritebackup
set undofile

set clipboard+=unnamed
set confirm
set splitbelow
set splitright
set termguicolors

set background=dark
colorscheme default

highlight EndOfBuffer ctermfg=240 guifg=#3a3a3a
set rtp+=/opt/homebrew/opt/fzf

" Use full block in normal/visual, blinking vertical bar in insert
set guicursor=
set guicursor+=n-v-c:block
set guicursor+=i-ci:ver25-blinkwait300-blinkon200-blinkoff150
set guicursor+=r-cr:hor20

" Force cursor shape via DECSCUSR (works in most modern terminals)
let &t_EI = "\e[2 q"   " block (Normal/Visual)
let &t_SI = "\e[6 q"   " bar (Insert)
let &t_SR = "\e[4 q"   " underline (Replace) optional
autocmd VimLeave * silent! execute "set t_me=\e[2 q"
