""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 'nocompatible' to ward off unexpected things that your distro might have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Sets how many lines of history VIM has to remember
set history=700

" Attempt to determine the type of a file based on its name and possibly its contents. Use this to allow intelligent auto-indenting for each filetype, and for plugins that are filetype specific
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Need to understand a little more
" With a map leader it's possible to do extra key combinations like <leader>w saves the current file
"=> let mapleader = ","
"=> let g:mapleader = ","

" A buffer becomes hidden when it is abandoned
set hid

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and this line is also included, vim will neither flash nor beep. If visualbell is unset, this does nothing.
set t_vb=


" Enable use of the mouse for normal mode
set mouse=n

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
