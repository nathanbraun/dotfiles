let g:vim_anki = {}
let g:vim_anki['anki_files_path'] = expand('$NOTES_DIR')
 
if g:vim_anki['anki_files_path'] !~ '/$'
  let g:vim_anki['anki_files_path'] .= '/'
endif

function! RandomChar()
  let l:chars = 'abcdefghijklmnopqrstuvwxyz0123456789'
  let l:index = rand() % len(l:chars)
  return l:chars[l:index]
endfunction

function! RandomFilenameAnki()
  let l:random_string = ''
  let l:i = 0
  while l:i < 4
    let l:random_string .= RandomChar()
    let l:i += 1
  endwhile
  let l:filename = l:random_string . '-anki.wiki'
  return l:filename
endfunction

function! g:vim_anki.CreateAnkiNote()
  let l:filename = RandomFilenameAnki()
  let l:fullpath = g:vim_anki['anki_files_path'] . l:filename

  execute 'e ' . l:fullpath

  " Add the header
  let l:date = strftime('%Y-%m-%d')
  let l:header = "---\ntitle: Untitled\ndate: " . l:date . "\nsynced: false\ntags: [anki]\n---\n\n"
  
  call setline(1, split(l:header, '\n'))
  write

  " Move the cursor to the first line below the header
  execute 'normal! G'

endfunction

command! NewAnkiNote call g:vim_anki.CreateAnkiNote()
