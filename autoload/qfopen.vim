" qfopen
" Author: skanehira
" License: MIT

function! qfopen#action() abort
  let opener = input("action: ")
  if opener ==# ""
    return
  endif
  call qfopen#open(opener)
endfunction

function! qfopen#open(opener) abort
  let winid = win_getid()
  if s:is_location(winid)
    let list = getloclist(winid)
  else
    let list = getqflist()
  endif
  let info = list[line(".")-1]
  let opener = a:opener
  if opener =~# "vne*" || opener =~# "vs*"
    let opener = "topleft " .. opener
  endif
  exe opener bufname(info.bufnr)
  call cursor(info.lnum, info.col)
  if a:opener !~# "tab*"
    call win_execute(winid, "wincmd J")
  endif
endfunction

function! s:is_location(winid) abort
  let info = getwininfo(a:winid)
  if empty(info)
    return 0
  endif
  return info[0].loclist ==# 1
endfunction
