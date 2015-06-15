call pathogen#infect() 
call pathogen#helptags()

syntax on
filetype indent plugin on
set noesckeys
set foldmethod=indent
set foldlevel=99
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch
set backspace=indent,eol,start
set ruler
set number
set wildignore+=*.pyc
set nowrapscan

inoremap jj <Esc>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F4> :NERDTreeToggle<CR>
nnoremap <Backspace> :b<Space>#<CR>
nnoremap <Space> za
nnoremap <C-L> zz

let g:syntastic_enable_signs=1
let g:netrw_liststyle=3
let delimitMate_matchpairs = "(:),[:],{:}"
let JSHintUpdateWriteOnly=1

python << EOF
import os
import sys
import vim
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

set wildignore+=*/project/assets/*
set t_Co=256
set background=dark

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

" Plugin options
let g:ctrlp_show_hidden = 1

" Run vim-flake8 after every save
autocmd BufWritePost *.py call Flake8()


" Highlight indents
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" Resize windows when terminal is resized
autocmd VimResized * :wincmd =
