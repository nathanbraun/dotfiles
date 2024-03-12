-- Shorten function name
vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd>HopLineBC<CR>", { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, "x", "K", "<cmd>HopLineBC<CR>", { noremap = true, silent = true })

print('Loaded Racket keymaps')
