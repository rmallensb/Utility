syntax on se title

set number          "show line numbers

set shiftwidth=4
set softtabstop=4   "number of spaces in tab when editing
set expandtab       "convert tabs to spaces

set mouse=a         "allow mouse

set autoindent      "auto indents on newline
set laststatus=2
set statusline=%F   "show filepath for opened file

set formatoptions+=r "auto complete comments

set incsearch       "sets increment search
set hlsearch        "highlight matches

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"remove arrow keys from Normal Mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

"remove arrow keys from Command Mode
cnoremap <Up> <Nop>
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>

"remove arrow keys from Insert Mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"remove arrow keys from Visual Mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
