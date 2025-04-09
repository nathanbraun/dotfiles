vim.cmd [[
highlight RBListsO0 guifg=#e6e6e6
highlight RBListsO1 guifg=#99ad6a
highlight RBListsO2 guifg=#c6b6ee
highlight RBListsO3 guifg=#8fbfdc
highlight RBListsO4 guifg=#cf6a4c
highlight RBListsO5 guifg=#ffb964
highlight RBListsO6 guifg=#cacfd2
highlight RBListsO7 guifg=#f0a0c0
highlight RBListsO8 guifg=#fad07a
highlight RBListsO9 guifg=#99ad6a
highlight RBListsO10 guifg=#c6b6ee
highlight RBListsO11 guifg=#8fbfdc

highlight RBListsB0 guifg=#c6b6ee
highlight RBListsB1 guifg=#8fbfdc
highlight RBListsB2 guifg=#fad07a
highlight RBListsB3 guifg=#f0a0c0
highlight RBListsB4 guifg=#8197bf
highlight RBListsB5 guifg=#c6b6ee
highlight RBListsB6 guifg=#f2c6c2
highlight RBListsB7 guifg=#c6b6ee
highlight RBListsB8 guifg=#70b950
highlight RBListsB9 guifg=#c6b6ee
highlight RBListsB10 guifg=#8fbfdc
highlight RBListsB11 guifg=#fad07a
]]

local group = vim.api.nvim_create_augroup("mygroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter",
  { group = group, pattern = "*.wiki", callback = function() vim.cmd("call rblist#enable()") end, })

vim.api.nvim_create_augroup("CustomFileType", { clear = true })
