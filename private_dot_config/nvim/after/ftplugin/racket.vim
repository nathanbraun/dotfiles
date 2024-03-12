if exists('b:undo_ftplugin')
  let b:undo_ftplugin = b:undo_ftplugin . '|nunmap <buffer> K|xunmap <buffer> K'
else
  let b:undo_ftplugin = 'nunmap <buffer> K|xunmap <buffer> K'
endif
