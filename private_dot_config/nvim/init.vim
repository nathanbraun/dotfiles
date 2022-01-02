filetype plugin on

call plug#begin('~/.local/share/nvim/plugged')

" essentials
Plug 'christoomey/vim-tmux-navigator'
Plug 'kana/vim-arpeggio'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-unimpaired'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" vimwiki
Plug 'vimwiki/vimwiki', { 'branch' : 'dev'}
Plug 'michal-h21/vim-zettel'

" appearances
Plug 'flazz/vim-colorschemes'
Plug 'lervag/vim-rainbow-lists', {'branch': 'main'}

" completion
Plug 'lifepillar/vim-mucomplete'
call plug#end()

"------------------------------------------------------------------------------- 
" basic mappings
"------------------------------------------------------------------------------- 

" set leader to space
let mapleader= "\<Space>"

" map jk to escape
let g:arpeggio_timeoutlens = {'j':400, 'k':200}
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

" splits
noremap <leader>vs :vsplit<CR>
noremap <leader>hs :split<CR>

" appearances
set termguicolors
colorscheme jellybeans
set number
set colorcolumn=81

let g:rblist_levels = 8

highlight RBListsO0 guifg=#FFFFFF
highlight RBListsO1 guifg=#99ad6a
highlight RBListsO2 guifg=#c6b6ee
highlight RBListsO3 guifg=#8fbfdc
highlight RBListsO4 guifg=#cf6a4c
highlight RBListsO5 guifg=#ffb964
highlight RBListsO6 guifg=#fad07a
highlight RBListsO7 guifg=#f0a0c0

highlight RBListsB0 guifg=#c6b6ee
highlight RBListsB1 guifg=#8fbfdc
highlight RBListsB2 guifg=#fad07a
highlight RBListsB3 guifg=#f0a0c0
highlight RBListsB4 guifg=#8197bf
highlight RBListsB5 guifg=#c6b6ee
highlight RBListsB6 guifg=#c6b6ee
highlight RBListsB7 guifg=#70b950

" buffers
let g:buftabline_numbers = 1
nnoremap <leader>lf <cmd>Telescope find_files<cr>
nnoremap <leader>lb <cmd>Telescope buffers<cr>
nnoremap <leader>lr <cmd>Telescope oldfiles<cr>
nnoremap <leader>l/ <cmd>Telescope search_history<cr>

" vimwiki settings
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown','diary_rel_path':''}]
noremap <leader>wj :VimwikiDiaryNextDay<CR>
noremap <leader>wk :VimwikiDiaryPrevDay<CR>

augroup vimrc
        autocmd!
        autocmd FileType vimwiki call rblist#enable()
augroup END

" auto reload changes to init.vim
autocmd! bufwritepost init.vim source %

" indentation
set expandtab
autocmd FileType vimwiki setlocal shiftwidth=2 tabstop=2
