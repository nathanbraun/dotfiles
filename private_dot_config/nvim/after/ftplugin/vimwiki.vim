silent! iunmap <buffer> <Tab>

if exists('b:did_ftplugin_personal') | finish | endif
let b:did_ftplugin_personal = 1

nnoremap <silent><buffer> o :<c-u>call CustomListo()<cr>
nnoremap <silent><buffer> O :<c-u>call CustomListO()<cr>

function CustomListo() 
  let l:enabled = rblist#enabled()
  if l:enabled
    call rblist#disable()
  endif
  call vimwiki#u#count_exe('call vimwiki#lst#kbd_o()')

  if l:enabled
    call rblist#enable()
  endif

endfunction

function CustomListO() 
  let l:enabled = rblist#enabled()
  if l:enabled
    call rblist#disable()
  endif
  " call rblist#disable()
  call vimwiki#u#count_exe('call vimwiki#lst#kbd_O()')

  if l:enabled
    call rblist#enable()
  endif
  " call rblist#enable()

endfunction

inoremap [[ [[<ESC> :ZettelSearch<CR>title:
