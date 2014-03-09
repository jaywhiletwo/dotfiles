call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
set hlsearch
set smartindent
set foldmethod=indent
set foldlevel=99
set scrolloff=3
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <Backspace> :b #<CR>
inoremap jj <Esc>
inoremap # X#
