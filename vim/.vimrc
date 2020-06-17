call plug#begin('~/.vim/plugged')

" Color Themes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator' " Better navigation integration with tmux
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jiangmiao/auto-pairs' " Bracket pairs

Plug 'scrooloose/nerdcommenter' " Comment fast
Plug 'davidhalter/jedi-vim' "Python autocomplete
Plug 'terryma/vim-multiple-cursors' " Multiple cursors like sublime

Plug 'frazrepo/vim-rainbow' " Rainbow brackets

Plug 'dense-analysis/ale' " Syntax checker
Plug 'vim-airline/vim-airline' " Status bar

Plug 'pangloss/vim-javascript'

call plug#end()

let g:ale_sign_warning = '?'
let g:ale_sign_column_always = 1
"let g:airline#extensions#ale#enabled = 1

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gf <Plug>(coc-references)
nnoremap <C-i> :GFiles<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:airline_powerline_fonts = 1

set rtp+=/usr/local/opt/fzf

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme onedark

set number
highlight LineNr ctermfg=DarkGrey
highlight Normal ctermbg=None

"" Global tabs/spaces
set smarttab     " use spaces instead of tabs
set tabstop=2    " global tab width
set shiftwidth=2
set expandtab    " use spaces instead of tabs
set laststatus=2 " Always show a status line

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-o> :NERDTreeToggle<CR>
map gb :tabp<CR>

""" Search
set ignorecase   " case-insensitive search
set smartcase    " but case-sensitive if expression contains a capital letter
set ruler        " show cursor position
set incsearch    " highlight matches as you type
set hlsearch     " highlight matches

:imap jk <Esc>
:set mouse=a "mouse support
inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O

set autoindent   " Copy indent from current line when starting a new line

" clear highlights
nnoremap <leader><space> :noh<CR>

map gb :tabp<CR>

inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O

nnoremap <silent> <C-p> :FZF<CR>

nnoremap \ :Ag<space>

" move line down/up
nnoremap <S-j> ddp
nnoremap <S-k> ddkkp

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with jk
tnoremap jk <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+x
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <C-x> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" mapleader config
map <Space> <Nop>
" map <Space> <Leader>
let mapleader = ","

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:rainbow_active = 1

set nobackup " no backups
set nowritebackup " No backups
set noswapfile " No swap files
set autoread " Automatically re-read files changed outside of vim
set nofoldenable " Disable folding

nnoremap <silent> <leader>o :All<cr>

nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>g :Git <CR>
