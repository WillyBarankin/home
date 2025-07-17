"Make after ":w":
"autocmd BufWritePost *.cpp make
autocmd Filetype cpp setlocal makeprg=g++\ -o\ ../bin/%<\ %\ -lncurses
packadd termdebug

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set autoindent
set smartindent
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue
set number
set relativenumber

"Mapleader setting:
set timeoutlen=1500
set showcmd
let mapleader = "\<Space>"

"Line number settings:
" Toggle line numbers
nnoremap <Leader>n :set number! <CR>
" Toggle relative line numbers
nnoremap <Leader>N :set relativenumber! <CR>
" Clear search highlight
nnoremap <Leader>h :noh <CR>

"Toggle paste mode
nnoremap <leader>p :set invpaste paste? <CR>

"Add empty line under ur above the cursor:
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j

" vim-powered terminal in split window
nnoremap <Leader>t :vert bo term ++close<cr>

"Shortcuts for compiling and running C++ programs (DRYed up with a function):
" Shortcuts for compiling and running C++ programs (DRYed up with a function):
function! CompileAndRunCpp(mode)
  write
  silent !clear; g++ -o ../bin/%< % -lncurses
  if a:mode ==# 'run'
    silent !../bin/%<
  elseif a:mode ==# 'term'
    vert bo term ../bin/%<
  endif
endfunction

autocmd Filetype cpp nnoremap <Leader>r :call CompileAndRunCpp('run')<CR>
autocmd Filetype cpp nnoremap <Leader>R :call CompileAndRunCpp('term')<CR>
autocmd Filetype cpp nnoremap <Leader>b :call CompileAndRunCpp('')<CR>
autocmd Filetype cpp nnoremap <Leader>B :call CompileAndRunCpp('')<CR>
autocmd Filetype cpp nnoremap <Leader>d :vert bo Termdebug %<<CR>
"Fix Delete:
inoremap <C-D> <C-O>x
"Auto close brackets:
"autocmd Filetype cpp inoremap ; <Esc>A;
autocmd Filetype cpp inoremap { {}<Left>
autocmd Filetype cpp inoremap {<CR> {<CR>}<Esc>O
autocmd Filetype cpp inoremap {{ {
autocmd Filetype cpp inoremap {} {}

autocmd Filetype cpp inoremap [ []<Left>
autocmd Filetype cpp inoremap [[ [
autocmd Filetype cpp inoremap [] []

autocmd Filetype cpp inoremap ( ()<Left>
autocmd Filetype cpp inoremap (( (

" Configure backup, swap, and undo directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile

" Enable system clipboard
set clipboard=unnamedplus

" Ensure syntax highlighting is always on
syntax on

" Improve search experience
set incsearch
set ignorecase
set smartcase
