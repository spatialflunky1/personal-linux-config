set secure
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0

" line numbers
set number

" for assembly
au BufRead,BufNewFile *.asm set filetype=nasm
au BufRead,BufNewFile *.inc set filetype=nasm

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

syntax on

colorscheme onedark

set nocompatible

call plug#begin()

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'

" For the file explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

" key mappings example (for COC)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> cs <Plug>(clangd.switchSourceHeader)
" there's way more, see `:help coc-key-mapings@en'

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Space>\<Space>\<Space>\<Space>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Include lua initialization config
lua require("init")
