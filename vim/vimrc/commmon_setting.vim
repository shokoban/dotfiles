""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                     Common Settings.                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line number.
set number
" Show status ber.
set laststatus=2
" Show command
set showcmd

" Show color of syntax
set t_Co=256
syntax on
highlight Comment ctermfg =240

" Show tab, space, new line
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:%,eol:↲
" Highlight full width space
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" Set tab
source ~/dotfiles/vim/vimrc/tabstop.vim

" Remove extra space at end of line
autocmd BufWritePre * :%s/\s\+$//ge

" Show line at 80 column
set colorcolumn =80
" Emphasize the cursor line
set cursorline
" Emphasize the cursor column
set nocursorcolumn

" A new line Enter in the normal mode
noremap <CR> i<CR><ESC>


"When enter normal mode, IME turn off
if has('unix')
    function! ImInActivate()
        call system('fcitx-remote -c')
    endfunction
    inoremap <ESC> <ESC>:call ImInActivate()<CR>
    inoremap <C-{> <C-{>:call ImInActivate()<CR>
    inoremap <C-c> <C-c>:call ImInActivate()<CR>
    set timeoutlen=15
endif

if has('win32') || has ('win64')
    let w:insert_input_active = 0
    function FcitxLeaveInsert()
        let s:input_status = system("fcitx-remote")
        if s:input_status == 2
            let w:insert_input_active = 1
            let l:a = system("fcitx-remote -c")
        endif
    endfunction

    function FcitxEnterInsert()
        if !exists(w:insert_input_active)
            let w:insert_input_active = 0
        endif
        if  w:insert_input_active != 0
            "
            let l:a = system("fcitx-remote -o")

            let w:insert_input_active = 0
        endif
    endfunction

    autocmd InsertLeave * call FcitxLeaveInsert()
    autocmd InsertEnter * call FcitxEnterInsert()

    set timeoutlen=15
endif

" For searting
set hlsearch
set incsearch
set smartcase
set wrapscan


