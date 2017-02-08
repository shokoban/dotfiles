" ========================================================================
" =                      Settings for dein.vim                           =
" ========================================================================

" If Unite.vim installed,
" type \":Unite dein" on vim when you want to check installed plugins.

" Set path of directorys of being dein.vim
"let s:dein_dir = expand('~/.cache/vim_plugins/dein')
let s:dein_dir = expand('~/.vim/plugins/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" The version of the dein.vim managed by dein.vin own.
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

" set path of toml file that is writen plugin.
let s:toml = '~/.vim/config/nvim/dein/.dein.toml'
let s:lazy_toml = '~/.vim/config/nvim/dein/.dein_lazy.toml'

" Load plugins.
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" First of all, install vimproc 
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif


" ========================================================================
" =                 Settings for each option of vim                      =
" ========================================================================

" エンコードの設定  
set encoding=utf-8

" シンタックスハイライトの有効化
syntax on 

" 行番号の表示
set number
" 80文字目にラインを入れる
set colorcolumn=80
hi ColorColumn ctermbg=red guibg=red

" カーソル行の強調
set cursorline

"スクロールする時に下が見えるようにする
set scrolloff=3

" 入力中のコマンドを表示する
set showcmd

" ノーマルモードに入ったら日本語入力を解除する
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
    if w:insert_input_active != 0
        let l:a = system("fcitx-remote -o")
        let w:insert_input_active = 0
    endif
endfunction

autocmd InsertLeave * call FcitxLeaveInsert()
autocmd InsertEnter * call FcitxEnterInsert()
set timeoutlen=15


" =======================================================================
"タブ、空白、改行の可視化
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:% ",eol:↲

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
     augroup ZenkakuSpace
         autocmd!
         autocmd ColorScheme       * call ZenkakuSpace()
         autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
     augroup END
     call ZenkakuSpace()
endif

" インデントをスペース2つ分に設定(デフォルト)
set tabstop=2
set shiftwidth=2

" ファイルタイプごとにタブインデントの指定
au BufNewFile,BufRead *.c    set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.cpp  set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.h    set nowrap tabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead *.java set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.py   set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.rs   set nowrap tabstop=4 shiftwidth=4 expandtab
au BufNewFile,BufRead *.rlib set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.rb   set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.html set nowrap tabstop=4 shiftwidth=4 expandtab

au BufNewFile,BufRead *.vim* set nowrap tabstop=4 shiftwidth=4 expandtab


" カーソル位置を記憶
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin on
    filetype indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab

" オートインデント
set smartindent
set autoindent
" =======================================================================
