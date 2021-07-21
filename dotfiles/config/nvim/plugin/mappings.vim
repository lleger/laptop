" Map <Leader> to ,
let mapleader = ","

" Shortcuts to write and exit insert
imap jj <Esc>
imap jw <Esc>:w<CR>

" Alpha sort a selection
vmap as :sort<CR>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Navigate window splits with the arrow keys
nnoremap <Left>  <C-w>h
nnoremap <Down>  <C-w>j
nnoremap <Up>    <C-w>k
nnoremap <Right> <C-w>l

" Resize splits with meta + the arrow keys
nnoremap <M-Up>    <Cmd>resize +10<CR>
nnoremap <M-Down>  <Cmd>resize -10<CR>
nnoremap <M-Right> <Cmd>vertical resize +10<CR>
nnoremap <M-Left>  <Cmd>vertical resize -10<CR>

" Clear search highlighting on <Esc>
nnoremap <Esc> <Cmd>nohlsearch<CR>

" Yank until the end of the line
nnoremap Y y$

" Window managemnet
nnoremap <Leader>wq <Cmd>q<CR>
nnoremap <Leader>ws <Cmd>split<CR>
nnoremap <Leader>wv <Cmd>vsplit<CR>
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>w= <C-w>=
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k
nnoremap <Leader>wl <C-w>l

" Formatter
nnoremap <silent> <leader>f :Format<CR>

" Trouble
nnoremap <silent> <leader>td :LspTroubleDocumentToggle<CR>

" Ecto Migrations
nnoremap <Leader>m <Cmd>echo system('mix ecto.migrate --to ' . split(expand('%:t'), '_')[0])<CR>
