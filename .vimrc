" other plugins:
" * rename -> :saveas
" * ag -> ag -ro PATTERN .


"""""""""""""""""""""""""""
" pathogen
execute pathogen#infect()

" vundle {{{1
" needed to run vundle (but i want this anyways)
set nocompatible
filetype off
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
Plugin 'christoomey/vim-tmux-navigator'

" add plugins before this
call vundle#end()

" now (after vundle finished) it is save to turn filetype plugins on

""""""""""""""""""""""""""""""""""""""
" get html indenting working
let g:html_indent_inctags = "html,body,head,tbody"
filetype indent on " html auto indent working
filetype plugin indent on
set autoindent " o goes down and then matches the indentation of the prev line
map <F8> gg=G``:echoerr 'Auto indented.'<CR>
" reload myvimrc with alt-r
map ® :so $MYVIMRC<CR>:echoerr '$MYVIMRC Reloaded.'<CR>

syntax on
syntax enable



set hlsearch " search highlighting.
set ignorecase " ignore case when i search by default
set smartcase " goes with ignorecase... It means that unless there is uppercase on the string, it's case insensive by default
set incsearch " see searc results as I type them in

set t_Co=256 "otherwise you'll only see  8bits
" Monokai gotham zenburn 256_noir 256_grayvim
colorscheme zenburn
" line numbers
set nu

"Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8


" for autocompletion, complete as much as possible
set wildmode=longest,full
"wrap lines by default

"https://github.com/sheerun/vimrc
set wrap linebreak
set showbreak=" "
"display line next to cursor
set cursorline
"common mistake of q: instead of :q
map q: :q
" keybindings
map <F2> :lnext<CR> "syntastic skip to error
map <F3> :lprevious<CR>
map <Esc><Esc> :w<CR>  " double escape to save
" mouse for scrolling and window resizing

set mouse=a

set backspace=indent,eol,start
set clipboard=unnamed
set backupcopy=yes

set noswapfile " no swap file
set expandtab " insert space characters whenever the tab key is pressed

set tabstop=2 " number of spaces when you press tab
set shiftwidth=2 " number of spaces for indentation
" for command mode
set runtimepath^=~/.vim/bundle/ctrlp.vim  "http://ctrlpvim.github.io/ctrlp.vim/#installation

" remove escape delay
set timeoutlen=1000 ttimeoutlen=0

" syntastic (for eslint)... pathogen is a dep
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

" change cursor shapase based on insert mode
" http://blog.terriblelabs.com/blog/2013/02/09/stupid-vim-tricks-how-to-change-insert-mode-cursor-shape-with-tmux/
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


" wrap toggle
function! ToggleWrap()
  if (&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunction
map <F9> :call ToggleWrap()<CR>


" load  vimrc while editing--> :so %
" reload vimrc from any file--> :so $MYVIMRC

" get rid of trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"vimdiff loafs another theme
" http://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
if &diff
    colorscheme Monokai
endif

" rebind arrow keys to do nothing
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
