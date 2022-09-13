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
" Plug 'mattfair/vim-zettel'
Plug 'tools-life/taskwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" zettel
Plug 'renerocksai/calendar-vim'
" Plug 'dkarter/bullets.vim'
Plug 'bmihai/nanootl'

" appearances
Plug 'flazz/vim-colorschemes'
" Plug 'lervag/vim-rainbow-lists', {'branch': 'main'}
Plug 'nathanbraun/vim-rainbow-lists'

" programming
Plug 'tpope/vim-commentary'
Plug 'kdheepak/lazygit.nvim'
Plug 'jpalardy/vim-slime'
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wakatime/vim-wakatime'
Plug 'SirVer/ultisnips'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" navigation
Plug 'airblade/vim-rooter'
Plug 'phaazon/hop.nvim'
" Plug 'chentoast/marks.nvim'

" Plug 'alok/notational-fzf-vim'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['json', 'python', 'elm', 'javascript']}
call plug#end()

set completeopt=menu,menuone,noselect

set shortmess+=c   " Shut off completion messages
" let g:mucomplete#completion_delay = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"------------------------------------------------------------------------------- 
" basic mappings
"------------------------------------------------------------------------------- 

" set leader to space
let mapleader= "\<Space>"

" map jk to escape
let g:arpeggio_timeoutlens = {'j':400, 'k':200}
call arpeggio#map('i', '', 0, 'jk', '<Esc>')

set viminfo='800,<50,s10,h,rA:,rB:

" splits
noremap <leader>vs :vsplit<CR>
noremap <leader>hs :split<CR>

" python
let g:python3_host_prog = '/Users/nathanbraun/neovim-python/bin/python'
let g:python_host_prog = '/Users/nathanbraun/neovim-python2/bin/python'

" appearances
set termguicolors
highlight Comment gui=italic
colorscheme jellybeans
set number
set colorcolumn=81

" search options
set ignorecase
set smartcase

" Utility maps for repeatable quickly change/delete current word
nnoremap c*   *``cgn
nnoremap c#   *``cgN
nnoremap cg* g*``cgn
nnoremap cg# g*``cgN
nnoremap d*   *``dgn
nnoremap d#   *``dgN
nnoremap dg* g*``dgn
nnoremap dg# g*``dgN

" date stuff
nnoremap <leader>dd "=strftime("%Y-%m-%d")<CR>P
nnoremap <leader>dw "=strftime("%Y-%W")<CR>P

" increment numbers
nnoremap <M-k> <C-a>
nnoremap <M-j> <C-x>

" git 
nnoremap <leader>gg :LazyGit<CR>

" hop
nnoremap S :w<CR>
nnoremap Y J
nmap K <cmd>HopLineBC<CR>
nmap J <cmd>HopLineAC<CR>
vmap K <cmd>HopLineBC<CR>
vmap J <cmd>HopLineAC<CR>
nmap H <cmd>HopWordBC<CR>
nmap L <cmd>HopWordAC<CR>

nnoremap s <cmd>HopWordMW<CR>

" slime options
nmap <leader>s <Plug>SlimeMotionSend
nmap <leader>ss <Plug>SlimeLineSend
xmap <leader>s <Plug>SlimeRegionSend
let g:slime_python_ipython = 1
let g:slime_target = "tmux"

let g:rblist_levels = 8

highlight RBListsO0 guifg=#e6e6e6
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

" snippet
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" buffers
let g:buftabline_numbers = 1
nnoremap <leader>lf <cmd>Telescope find_files<cr>
nnoremap <leader>lb <cmd>Telescope buffers<cr>
nnoremap <leader>lr <cmd>Telescope oldfiles<cr>
nnoremap <leader>l/ <cmd>Telescope search_history<cr>

" ------------------------------------------------------------------------------ 
" vimwiki settings
" ------------------------------------------------------------------------------
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown','diary_rel_path':''}]

noremap <leader>wj :VimwikiDiaryNextDay<CR>
noremap <leader>wk :VimwikiDiaryPrevDay<CR>
nmap <c-cr> :VimwikiFollowLink<cr>
nmap <leader>wnl <Plug>VimwikiVSplitLink
nmap <leader>wnr <Plug>VimwikiSplitLink

let g:taskwiki_markup_syntax='markdown'
let g:taskwiki_data_location='/Users/nathanbraun/code/github.com/nathanbraun/.task/'

" Disable default keymappings
let g:zettel_default_mappings = 0 
let g:zettel_format = '%y%m%d-%H%M'

" function! s:enable_coc_for_type()
"         let l:filesuffix_whitelist = ['elm']
"         if index(l:filesuffix_whitelist, expand('%:e')) == -1
"                 let b:coc_enabled = 0
"         endif
" endfunction

" autocmd BufRead,BufNewFile * call s:enable_coc_for_type()
" This is basically the same as the default configuration
augroup filetype_vimwiki
 autocmd!
 autocmd FileType vimwiki inoremap <silent> [[ [[<esc>:ZettelSearch<CR>title: 
 autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
 autocmd FileType vimwiki xmap zx <Plug>ZettelNewSelectedMap
 autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink

 nnoremap <leader>zn :ZettelNew<cr><cr>:4d<cr>:w<cr>ggA
 nnoremap <leader>zt :call ZettelNewSlug("tech")<cr><cr>:4d<cr>:w<cr>ggA
 nnoremap <leader>zw :call ZettelNewSlug("write")<cr><cr>:4d<cr>:w<cr>ggA
 nnoremap <leader>zp :call ZettelNewSlug("plan")<cr><cr>:4d<cr>:w<cr>ggA

 " open file bindings
 autocmd FileType vimwiki nnoremap <leader>zo :ZettelOpen<CR>title: 
 autocmd FileType vimwiki nmap <leader>zf :ZettelOpen<CR>
 autocmd FileType vimwiki nnoremap <leader>zb :Lines<CR>title:<Space>
 autocmd FileType vimwiki call rblist#enable()
augroup END

" auto reload changes to init.vim
autocmd! bufwritepost init.vim source %

" indentation
set expandtab
autocmd FileType vimwiki setlocal shiftwidth=2 tabstop=2

" shortcuts
noremap <silent><leader>lz :e ~/vimwiki/zettelkasten.wiki<CR>

" weekly plan
noremap <silent><leader>lw :e ~/vimwiki/plan-220404-0803.wiki<CR>

" reading list
noremap <silent><leader>ll :e ~/vimwiki/210331-1521.wiki<CR>

" block tasks
noremap <silent><leader>ltb :e ~/vimwiki/plan-210213-1520.wiki<CR>

" medium tasks
noremap <silent><leader>ltm :e ~/vimwiki/plan-220512-1527.wiki<CR>

" projects
noremap <silent><leader>lp :e ~/vimwiki/plan-220511-1508.wiki<CR> 

" someday
noremap <silent><leader>ls :e ~/vimwiki/210104-2103.wiki<CR> 

" week checklist
noremap <silent><leader>lcw :e ~/vimwiki/plan-220404-0858.wiki<CR> 
noremap <silent><leader>lcd :e ~/vimwiki/201103-1510.wiki<CR> 

" noremap <silent><leader>lw :e ~/vimwiki/write-220402-1557.wiki<CR>

" let g:zettel_fzf_command = "rg --column --line-number --color=always --smart-case --regexp '^title: (.+)' --replace '$1'"
" let g:zettel_fzf_options = ['--with-nth=-1']

" misc
set noswapfile
noremap : q:i
noremap / q/i

inoremap ;dt <C-R>=strftime("%c")<CR>

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch',
    \]


" ------------------------------------------------------------------------------
" coc settings
" set updatetime=300
" set shortmess+=c
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" nnoremap <silent> K :call <SID>show_documentation()<CR>

function ZettelNewSlug(slug)
        let g:zettel_format = a:slug . '-%y%m%d-%H%M'
        ZettelNew
        let g:zettel_format = '%y%m%d-%H%M'
endfunction

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

lua << END
require('hop').setup()

local custom_attach = function(client)
      if client.config.flags then
        client.config.flags.allow_incremental_sync = true
      end
    end

local lsp = require "lspconfig" -- add this
lsp.elmls.setup{
  on_attach = custom_attach
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- require'marks'.setup({})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local cmp = require("cmp")
cmp.setup({
   snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      }),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "ultisnip" },
      { name = "path" },
   },
})

vim.cmd([[
augroup NvimCmp
au!
au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]])

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    -- capabilities = capabilities
  -- }

  require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
  }
END
