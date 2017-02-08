" set tab
set tabstop=2
set shiftwidth=2
" Set indent type each file
au BufNewFile,BufRead *.c    set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.cpp  set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.cxx  set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.h    set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.hpp  set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.hxx  set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.java set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.py   set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.rs   set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.rlib set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.rb   set nowrap tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead *.html set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *vim* set nowrap tabstop=4 shiftwidth=4 expandtab

if has("autocmd")
filetype plugin indent on

autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif
