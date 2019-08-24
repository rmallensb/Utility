syntax on se title

set number          "show line numbers

set shiftwidth=4
set softtabstop=4   "number of spaces in tab when editing
set expandtab       "convert tabs to spaces

set autoindent      "auto indents on newline
set laststatus=2
set statusline=%F   "show filepath for opened file

set formatoptions+=r "auto complete comments

set incsearch       "sets increment search
set hlsearch        "highlight matches

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
