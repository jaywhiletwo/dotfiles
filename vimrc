call pathogen#infect() 
call pathogen#helptags()

syntax on
filetype indent plugin on
set foldmethod=indent
set foldlevel=99
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set backspace=indent,eol,start
set ruler
set number
set wildignore+=*.pyc
highlight LineNr ctermbg=black ctermfg=blue

inoremap jj <Esc>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F4> :NERDTreeToggle<CR>
nnoremap <Backspace> :b<Space>#<CR>
nnoremap <Space> za

let g:syntastic_enable_signs=1

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
