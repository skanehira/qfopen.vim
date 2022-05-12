" qfopen
" Author: skanehira
" License: MIT

let s:opener_list = [
      \ "vnew",
      \ "new",
      \ "split",
      \ "vsplit",
      \ "tabnew",
      \ "botright",
      \ "topleft",
      \ "rightbelow",
      \ "leftabove",
      \ "vertical",
      \ ]

function! qfopen#opener_list(al, line, pos) abort
  if a:al ==# ""
    return s:opener_list
  endif
  let words = split(a:al, " ")
  let word = words[len(words)-1:][0]
  return map(filter(copy(s:opener_list),
        \ { _, v -> v =~# "^" .. word .. ".\\+"}),
        \ { _, v -> join(add(words[:-2], v), " ")}
        \ )
endfunction

function! qfopen#action() abort
  let opener = input("action: ", "", "customlist,qfopen#opener_list")
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
  exe opener bufname(info.bufnr)
  call cursor(info.lnum, info.col)
endfunction

function! s:is_location(winid) abort
  let info = getwininfo(a:winid)
  if empty(info)
    return 0
  endif
  return info[0].loclist ==# 1
endfunction
