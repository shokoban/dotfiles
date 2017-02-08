""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                 Neobundle.vim Settings.                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set directorys of being neobundle.vim
let s:neobundle_dir = expand('~/.vim/plugins/neobundle')
let s:neobundle_repo_dir = s:neobundle_dir.'/repos/github.com/Shougo/neobundle.vim'

" Execute git clone automatically, if neobundle.vim do not exist.
if !isdirectory(s:neobundle_repo_dir)
    execute '!git clone https://github.com/Shougo/neobundle.vim' s:neobundle_repo_dir
endif
execute 'set runtimepath^=' . s:neobundle_repo_dir

" Start setting of NeoBundle.vim from here.
call neobundle#begin(s:neobundle_dir)

" The version of the NeoBundle.vim managed by NeoBundle.vim own.
NeoBundleFetch 'Shougo/neobundle.vim'

" Write plugins that you want to install below.
NeoBundle 'Shougo/unite.vim'
" Auto
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
            \ 'colorscheme': 'landscape'
            \ }
" Type :NERDTree to run
NeoBundle 'scrooloose/nerdtree'
" Auto
NeoBundle 'Townk/vim-autoclose'
" Type :QuickRun to run.
NeoBundle 'thinca/vim-quickrun'
" Type :EasyAlign {foo} to run
"   \Exanple: :EasyAlign *=
"             :EasyAlign **=
NeoBundle 'junegunn/vim-easy-align'
" Auto
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle "Shougo/neocomplete.vim"

" End setting of NeoBundle.vim.
call neobundle#end()

" Activate plugins.
filetype plugin indent on

" When executeing vim, install plugins that is not installed.
NeoBundleCheck

