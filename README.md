# qfopen.vim
Provides way that open file on quickfix and location list.

![](https://i.gyazo.com/33318afa944229673d4689a1c2c736aa.gif)

## Requirements
- neovim: v0.5.0 ~  
- vim   : v8.1.1418 ~

## Default key mapping

| key map                      | description                  |
|------------------------------|------------------------------|
| `<Plug>(qfopen-action)`      | Input an action to open file |
| `<Plug>(qfopen-open-split)`  | Open file with `split`       |
| `<Plug>(qfopen-open-vsplit)` | Open file with `vsplit`      |
| `<Plug>(qfopen-open-tab)`    | Open file with `tabnew`      |

## Usage
```vim
augroup qfopen-bufenter
  function! s:qfopen_keymap() abort
    map <buffer> a <Plug>(qfopen-action)
    map <buffer> <C-v> <Plug>(qfopen-open-vsplit)
    map <buffer> <C-x> <Plug>(qfopen-open-split)
    map <buffer> <C-t> <Plug>(qfopen-open-tab)
  endfunction
  au!
  au FileType qf call s:qfopen_keymap()
augroup END
```

## Author
skanehira
