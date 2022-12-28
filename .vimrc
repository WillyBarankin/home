"Make after ":w":
"autocmd BufWritePost *.cpp make
autocmd Filetype cpp setlocal makeprg=g++\ -o\ %<\ %\ -lncurses
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
nnoremap <Leader>n :set number! <CR>
nnoremap <Leader>N :set relativenumber! <CR>
nnoremap <Leader>h :noh <CR>

"Add empty line under ur above the cursor:
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j

" vim-powered terminal in split window
nnoremap <Leader>t :vert bo term ++close<cr>

"Shortcuts for compiling and running C++ programs:
autocmd Filetype cpp nnoremap <Leader>r :w<CR>:!clear; g++ -o %< % -lncurses<CR>:!./%< <CR>
autocmd Filetype cpp nnoremap <Leader>R :w<CR>:make<CR>:vert bo term ./%<<CR>
autocmd Filetype cpp nnoremap <Leader>b :w<CR>:!clear; g++ -o %< % -lncurses<CR>
autocmd Filetype cpp nnoremap <Leader>B :w<CR>:!clear; g++ -o %< % -lncurses<CR>
autocmd Filetype cpp nnoremap <Leader>d :vert bo Termdebug %<<CR>
"Fix Delete:
inoremap <C-D> <C-O>x
"Auto close brackets:
autocmd Filetype cpp inoremap ; <Esc>A;
autocmd Filetype cpp inoremap { {}<Left>
autocmd Filetype cpp inoremap {<CR> {<CR>}<Esc>O
autocmd Filetype cpp inoremap {{ {
autocmd Filetype cpp inoremap {} {}

autocmd Filetype cpp inoremap [ []<Left>
autocmd Filetype cpp inoremap [[ [
autocmd Filetype cpp inoremap [] []

autocmd Filetype cpp inoremap ( ()<Left>
autocmd Filetype cpp inoremap (( (
