local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- hop
keymap("n", "Y", "J", opts)
keymap("n", "s", "<cmd>Pounce<CR>", opts)
keymap("n", "S", "<cmd>PounceRepeat<CR>", opts)
keymap("v", "s", "<cmd>Pounce<CR>", opts)
keymap("n", "K", "<cmd>HopLineBC<CR>", opts)
keymap("n", "J", "<cmd>HopLineAC<CR>", opts)
keymap("n", "H", "<cmd>HopWordBC<CR>", opts)
keymap("n", "L", "<cmd>HopWordAC<CR>", opts)
keymap("v", "K", "<cmd>HopLineBC<CR>", opts)
keymap("v", "J", "<cmd>HopLineAC<CR>", opts)
keymap("v", "H", "<cmd>HopWordBC<CR>", opts)
keymap("v", "L", "<cmd>HopWordAC<CR>", opts)

-- vimwiki
keymap("n", "<leader>wk", ":VimwikiDiaryPrevDay<CR>", opts)
keymap("n", "<leader>wj", ":VimwikiDiaryNextDay<CR>", opts)

-- links
keymap("n", "<leader>lz", ":e ~/notes/zettelkasten.wiki<CR>", opts)

-- tech stuff
keymap("n", "<leader>ldo", ":e ~/notes/210313-1347.wiki<CR>", opts)

-- writing
keymap("n", "<leader>lwr", ":e ~/notes/tzvs.wiki<CR>", opts)

-- work
keymap("n", "<leader>lwo", ":e ~/notes/c6f0.wiki<CR>", opts)

-- productivity/self-improvement
keymap("n", "<leader>lpr", ":e ~/notes/q1tt.wiki<CR>", opts)

-- week notes
keymap("n", "<leader>lwe", ":e ~/notes/lks9.wiki<CR>", opts)

-- week checklist
keymap("n", "<leader>lwc", ":e ~/notes/w74x.wiki<CR>", opts)

-- day checklist
keymap("n", "<leader>ldc", ":e ~/notes/7i9q.wiki<CR>", opts)

-- books
keymap("n", "<leader>lbo", ":e ~/notes/76oo.wiki<CR>", opts)

-- kids
keymap("n", "<leader>lki", ":e ~/notes/di63.wiki<CR>", opts)

-- habits
keymap("n", "<leader>lha", ":e ~/notes/a84s.wiki<CR>", opts)

-- 1-2 pomodoro tasks
keymap("n", "<leader>l1p", ":e ~/notes/ppqo.wiki<CR>", opts)

-- block tasks
keymap("n", "<leader>lbl", ":e ~/notes/17h3.wiki<CR>", opts)

-- reading list
keymap("n", "<leader>lme", ":e ~/notes/rkh2.wiki<CR>", opts)

-- projects
keymap("n", "<leader>lpj", ":e ~/notes/bul8.wiki<CR>", opts)

-- someday
keymap("n", "<leader>lso", ":e ~/notes/30x0.wiki<CR>", opts)

-- learning
keymap("n", "<leader>lle", ":e ~/notes/4syy.wiki<CR>", opts)

-- notes
keymap("n", "<leader>lno", ":e ~/notes/0g5a.wiki<CR>", opts)


-- Normal --

-- find
keymap("n", "<leader>lf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>lbu", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>lr", ":Telescope oldfiles<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)
keymap("n", "<leader>vs", ":vsplit<CR>", opts)
keymap("n", "<leader>hs", ":split<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", ":", "q:i", opts)
keymap("n", "/", "q/i", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- j and k escape in insert mode
local ok, result = pcall(
  vim.cmd,
  [[call arpeggio#map('i', '', 0, 'jk', '<Esc>')]])

keymap("n", "<leader>s", "<Plug>SlimeMotionSend", {silent = true})
keymap("n", "<leader>ss", "<Plug>SlimeLineSend", {silent = true})
keymap("x", "<leader>s", "<Plug>SlimeRegionSend", {silent = true})

keymap("n", "<leader>gg", ":LazyGit<CR>", opts)

keymap("x", "ga", "<Plug>(EasyAlign)", {silent = true})
keymap("n", "ga", "<Plug>(EasyAlign)", {silent = true})

keymap('x', '<leader>or', ":<C-U>'<,'>!sort -R<CR>", opts)

keymap("n", "<leader>?", ":set spell!<CR>", opts)
keymap("n", "<leader>c", "<cmd>AIChat<CR>", opts)

function _G.replace_quotes()
    vim.cmd('silent! %s/“/"/g')
    vim.cmd('silent! %s/”/"/g')
    vim.cmd('silent! %s/’/\'/g')
    vim.cmd('silent! %s/…/... /g')

end

keymap("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", opts)
keymap("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap("n", "<c-j>", "<cmd>TmuxNavigatedown<cr>", opts)
keymap("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", opts)

vim.api.nvim_set_keymap('n', '<leader>r\'', ':lua _G.replace_quotes()<CR>', { noremap = true, silent = true })

keymap("n", "<leader>ai", "<cmd>AINewPersistentChat<cr>", opts)
