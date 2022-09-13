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

-- Normal --

-- find
keymap("n", "<leader>lf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>lb", ":Telescope buffers<CR>", opts)
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

-- links
keymap("n", "<leader>lz", ":e ~/vimwiki/zettelkasten.wiki<CR>", opts)
keymap("n", "<leader>lw", ":e ~/vimwiki/plan-220404-0803.wiki<CR>", opts)
keymap("n", "<leader>ll", ":e ~/vimwiki/210331-1521.wiki<CR>", opts)
keymap("n", "<leader>ltb", ":e ~/vimwiki/plan-210213-1520.wiki<CR>", opts)
keymap("n", "<leader>ltm", ":e ~/vimwiki/plan-220512-1527.wiki<CR>", opts)
keymap("n", "<leader>lp", ":e ~/vimwiki/plan-220511-1508.wiki<CR>", opts)
keymap("n", "<leader>ls", ":e ~/vimwiki/210104-2103.wiki<CR>", opts)
keymap("n", "<leader>lcd", ":e ~/vimwiki/201103-1510.wiki<CR>", opts)

-- week notes
keymap("n", "<leader>lw", ":e ~/vimwiki/lks9.wiki<CR>", opts)

-- week checklist
keymap("n", "<leader>lcw", ":e ~/vimwiki/w74x.wiki<CR>", opts)

-- books
keymap("n", "<leader>lk", ":e ~/vimwiki/76oo.wiki<CR>", opts)
