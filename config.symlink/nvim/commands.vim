" Define some custom commands
"
command! Chmodx !chmod +x %

" relative path  (src/foo.txt)
nnoremap <leader>cf :let @+=expand("%")<CR>

" absolute path  (/something/src/foo.txt)
nnoremap <leader>cF :let @+=expand("%:p")<CR>

" filename       (foo.txt)
nnoremap <leader>ct :let @+=expand("%:t")<CR>

" directory name (/something/src)
nnoremap <leader>ch :let @_=expand("%:p:h")<CR>
