set nocompatible
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim' | Plug 'junegunn/limelight.vim'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'vim-scripts/fountain.vim' | Plug 'tpope/vim-markdown' | Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox' | Plug 'preservim/nerdtree'
Plug 'phanviet/vim-monokai-pro'
call plug#end()
"General Settings
set encoding=UTF-8 nobackup nowritebackup nocursorline splitbelow splitright wildmode=longest,list,full
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab spell spelllang=en_us
set fillchars+=eob:\ 
au BufRead,BufNewFile *.fountain set filetype=fountain
set hidden 
set relativenumber
set smartindent
set nowrap 
set smartcase
set noswapfile
set nu
set incsearch
set scrolloff=8 " Start scrolling from 8 spaces from the end
"set colorcolumn=1
set signcolumn=yes
set cursorline
set nohlsearch

"Key-bindings  uoianion  iioja
let mapleader=" "
nnoremap <leader>s :source ~/.config/nvim/init.vim<CR>
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader><Space> :CtrlP<CR> 
nnoremap <leader>n :NERDTreeToggle<CR>
"nnoremap <leader>z :set invrnu invnu<CR>
nnoremap <leader><C-l> :set nofoldenable<CR>
nnoremap <C-l> :set foldmethod=indent<CR>
nnoremap <C-k> :set foldmethod=syntax<CR>
nnoremap Q <nop>
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

"Color Settings
colorscheme gruvbox


set background=dark
"set termguicolors
"colorscheme monokai_pro
let g:lightline = {
      \ 'colorscheme': 'monokai_pro',
      \ }

"let g:limelight_conceal_ctermfg = 240
"let g:limelight_conceal_guifg = '#777777'
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"Goyo Settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi! Normal ctermbg=NONE guibg=NONE 
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
