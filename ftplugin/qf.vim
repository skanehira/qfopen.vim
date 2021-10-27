" qf
" Author: skanehira
" License: MIT

nnoremap <buffer> <silent> <Plug>(qfopen-action) :call qfopen#action()<CR>
nnoremap <buffer> <silent> <Plug>(qfopen-open-split) :call qfopen#open("split")<CR>
nnoremap <buffer> <silent> <Plug>(qfopen-open-vsplit) :call qfopen#open("vsplit")<CR>
nnoremap <buffer> <silent> <Plug>(qfopen-open-tab) :call qfopen#open("tabnew")<CR>
