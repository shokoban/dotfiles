""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" This script is aiming for cross-platform, but I have not  "
"" been able to complete. Although it works normally on ubu- "
"" ntu OS, it does not work properly on windows OS. Please   "
"" be careful when using this .vimrc.                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                        Initialize.                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
    " Is this necessary?
    filetype off
    set encoding =utf-8
endif

let $path_to_vimrc = '~/dotfiles/vim/vimrc'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""               From here, start main script                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('unix')
    if system("which git") == ""
        source $path_to_vimrc/no_plugin_setting.vim
    else
        source $path_to_vimrc/plugin_setting.vim
    endif
elseif has('win32') || has ('win64')
    if system("where git") == ""
        source $path_to_vimrc/no_plugin_setting.vim
    else
        source $path_to_vimrc/plugin_setting.vim
    endif
endif

source $path_to_vimrc/commmon_setting.vim

