set nocompatible            " Make vim not vi-compatible

"" --Plugins--
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin()

"" --File Tree--
Plug 'scrooloose/nerdtree'
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

"" --Code Syntax Highlighting--
Plug 'sheerun/vim-polyglot'

"" --Fuzzy File Searching--
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <silent> <C-t> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-h> :History<CR>

"" --RipGrep--
Plug 'jremmen/vim-ripgrep'

"" --Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json' ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" inoremap <silent><expr> <TAB>
"         \ pumvisible() ? "\<C-n>" :
"         \ <SID>check_back_space() ? "\<TAB>" :
"         \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"" --Linter--
Plug 'neoclide/coc-eslint'

"" --Git Diff
Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

"" -- Git Fugitive
Plug 'tpope/vim-fugitive'


call plug#end()

"" --Set Regex engine - typescript highlighting bug
set regexpengine=0

"" --Formatting--
set shiftwidth=2            " Use 4 spaces
set softtabstop=2           " In increments of 4 spaces
set expandtab               " Use spaces in lieu of tabs
set autoindent              " Automatically indent
set tabstop=2               " Tab spacing
set shiftround              " Indent/outdent to the nearest tabstop
filetype plugin indent on   " detection, plugin, indent = on, on, on
set pastetoggle=<F2>        " Toggle pastemode with F2
set nojoinspaces            " Don't insert two spaces after . ? ! on join


"" --Line Numbers--
set number                  " Turn on absolute number for current line
set relativenumber          " Turn on line numbers

"" --Colors--
syntax enable               " Turn on syntax highlighting

"" --Search--
set nohlsearch              " Don't keep highlighting searched phrases
set incsearch               " Highlight as you're typing your search
set ignorecase              " Ignore case in searches
set smartcase               " Case sensitive if search includes a capital letter

"" --Commmands--
set history=100             " Keep 100 lines of command history

"" --UI--
set ruler                   " Display info at the bottom
set showmode                " Display mode info in bottom left
set showcmd                 " Display incomplete commands in the bottom right of the screen

"" --Sounds--
set vb t_vb=""              " Turn off beeping. does this work?

"" --Buffers--
set hidden                  " Allow switching between modified buffers.

"" --Scrolling--
set scrolloff=5             " Keep 5 lines above and below the cursor
set sidescrolloff=10        " Keep 10 columns to thet left and right of the cursor

"" --Misc--
set backspace=indent,eol,start  " Fix backspace so that it works
set ttimeoutlen=0           " Fix delay using esc and O. http://stackoverflow.com/a/2158610/1639983

"" --vim-javascript--
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1

"" --vim-jsx--
" JSX in .js files
let g:jsx_ext_required = 0

"" --vim-scala--
" Use Scaladoc style comment indentation
let g:scala_scaladoc_indent = 1

"" --Maps--
let mapleader=" "           " Change leader to <SPACE>

" Map for sudo write and force quit
nnoremap <Leader>W :w !sudo tee % > /dev/null
nnoremap <Leader><ESC> :qa!<CR>

" Next result and recenter
noremap <Leader>n nzz
noremap <Leader>N Nzz

"" --vim-argwrap--
" Wrap and unwrap arguments
nnoremap <silent> <Leader>a :ArgWrap<CR>

" Cycle over buffers with tab
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" Pressing F1 when you mean to press ESC is the worst
map <F1> <NOP>
" Q usually goes into ex mode
map Q <NOP>

" If C and D operate to end, why does Y yank the whole line?
nnoremap Y y$

" Visual block select current line without indent
nnoremap vv ^<C-v>g_

" Insert literal tab character with <S-Tab>
inoremap <S-Tab> <C-V><Tab>

" Re-indent whole file and return cursor to position
nnoremap <Leader>= gg=G``

" Set binding for toggling use of the arrow keys
nnoremap <Leader>k :ToggleArrowKeys<CR>

" Source local machine vimrc settings
if filereadable(expand("~/.vimrc_local"))
    source ~/.vimrc_local
endif

" Use machine's clipboard for copying/pasting
set clipboard=unnamed

" Allow mouse scrolling
:set mouse=a

" Auto close parenthesis/brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
