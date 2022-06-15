
set nocompatible            " Make vim not vi-compatible

"" --Formatting--
set shiftwidth=4            " Use 4 spaces
set softtabstop=4           " In increments of 4 spaces
set expandtab               " Use spaces in lieu of tabs
set autoindent              " Automatically indent
set tabstop=4               " Tab spacing
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

