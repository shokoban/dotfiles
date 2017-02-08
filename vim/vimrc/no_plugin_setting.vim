""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                    No plugin Settings.                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set information in statusline
set statusline =%<%F\ %m%r%h%w%=[%n][%{&ff}][%{(&fenc!=''?&fenc:&enc)}]%y[%l/%L]

" Change statusline color, Once Enter normal mode.
let g:hi_insert = 'highlight StatusLine ctermfg=white ctermbg=darkred cterm=none'

if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction

