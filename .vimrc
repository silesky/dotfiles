
" pathogen
  execute pathogen#infect()

           " vundle {{{1
" needed to run vundle (but i want this anyways)
        set nocompatible

" vundle needs filtype plugins off
" i turn it on later

" set the runtime path for vundle

set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
call vundle#begin()

" list of plugins {{{2
" let Vundle manage Vundle (this is required)
"old: Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean
" 

" YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
Plugin 'bling/vim-airline'
Plugin 'marijnh/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rizzatti/dash.vim'
" add plugins before this
call vundle#end()

" now (after vundle finished) it is save to turn filetype plugins on

filetype plugin indent on

syntax on
syntax enable
set t_Co=256 "otherwise you'll only see  8bits
let g:solarized_termcolors=256
colorscheme monokai

set nu " line numbers
set nowrap " disable wrapping

" keybindings
map <F2> :lnext<CR> "syntastic skip to error
map <F3> :lprevious<CR>
map <Esc><Esc> :w<CR>  " double escape to save

set backspace=indent,eol,start
set clipboard=unnamed
set backupcopy=yes
filetype plugin indent off
set noswapfile " no swap file
set expandtab " insert space characters whenever the tab key is pressed
set tabstop=2 " number of spaces when you press tab 
set shiftwidth=2 " number of spaces for indentation
" for command mode
set runtimepath^=~/.vim/bundle/ctrlp.vim  "http://ctrlpvim.github.io/ctrlp.vim/#installation

" syntastic (for eslint)... pathogen is a dep
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']


" change cursor shapase based on insert mode
" http://blog.terriblelabs.com/blog/2013/02/09/stupid-vim-tricks-how-to-change-insert-mode-cursor-shape-with-tmux/
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

