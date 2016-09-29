so ~/.vimrc_osx.vim
so ~/.vimrc_linux.vim

""""""PATHOGEN""""""""""
execute pathogen#infect()
"..........................

""""""VIM PLUG""""""""""""""""""""""""
if empty(glob("~/.vim/autoload/plug.vim"))
  execute '!mkdir -p ~/.vim/ ~/.vim/autoload ~/.vim/bundle'
  execute '!curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim'
  execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')
" YOUR LIST OF PLUGINS GOES HERE LIKE THIS:
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jszakmeister/vim-togglecursor'
Plug 'christoomey/vim-tmux-navigator'
Plug 'maksimr/vim-jsbeautify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-sleuth'
"detect indent
" sudo npm -g install instant-markdown-d
Plug 'suan/vim-instant-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'marijnh/tern_for_vim'
Plug 'sjl/vitality.vim' "make vim play nicely with iterm and tmux
Plug 'tpope/vim-eunuch' "\:MOVE etc
Plug 'vim-airline/vim-airline' "busy statusline on the bottom
function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }

call plug#end()
" DIRECTIONS:
" YouCompleteMe--
" cd ~/.vim/plugged/YouCompleteMe/
"     git submodule update --init --recursive
"  cd ~/.vim/plugged/YouCompleteMe/ && ./install.py
"
" Tern--
" cd /tern_for_vim/ && npm install
"
" InstantMarkdown--
"  sudo npm -g install instant-markdown-d
"
" ............................................

" get html indenting working
let g:html_indent_inctags = "html,body,head,tbody"
filetype indent on " html auto indent working
filetype plugin indent on
set autoindent " o goes down and then matches the indentation of the prev line
noremap <F8> gg=G``:echoerr 'Auto indented.'<CR>
inoremap <F8> gg=G``:echoerr 'Auto indented.'<CR>
" reload myvimrc with alt-r
noremap <f12> :so $MYVIMRC<CR>:echoerr '$MYVIMRC Reloaded.'<CR>

syntax on
syntax enable



set hlsearch " search highlighting.
set ignorecase " ignore case when i search by default
set smartcase " goes with ignorecase... It means that unless there is uppercase on the string, it's case insensive by default
set incsearch " see searc results as I type them in

set t_Co=256 "otherwise you'll only see  8bits
" Monokai gotham zenburn 256_noir 256_grayvim
colorscheme zenburn
" tab colors
hi TabLineFill ctermfg=DarkGray

" line numbers
set nu

"Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8


" Always show window statuses
set laststatus=2
set wildmenu
" for autocompletion, complete as much as possible
set wildmode=longest,full

"wrap lines by default
"https://github.com/sheerun/vimrc
set wrap linebreak
set showbreak=" "
"display line next to cursor
" set cursorline
"common mistake of q: instead of :q
map q: :q
" keybindings
noremap <F2> :lnext<CR> "syntastic skip to error

map <Esc><Esc> :w<CR>  " double escape to save
" mouse for scrolling and window resizing

set mouse=a
set backspace=indent,eol,start
set clipboard=unnamed
set clipboard=unnamedplus
set backupcopy=yes
set noswapfile " no swap file

set tabstop=2 " The width of a TAB is set to a [number]
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set shiftwidth=2    " Indents will have a width of [number]
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab     " Expand TABs to spaces
set smarttab      " Enabling this will make the tab key (in insert mode) insert spaces or tabs to
"go to the next indent of the next tabstop when the cursor is at the beginning
"of a line (ie: the only preceding characters are whitespace)

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

" wrap toggle
function! ToggleWrap()
  if (&wrap == 1)
    set nowrap
  else
    set wrap
  endif
endfunction
map <F9> :call ToggleWrap()<CR>


" get rid of trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab

"vimdiff loafs another theme
" http://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
if &diff
  colorscheme Monokai
endif


" rebind arrow keys to do nothing
nnoremap <Right> :echo "No Right for you!"<CR>
vnoremap <Right> :<C-u>echo "No Right for you!"<CR>
inoremap <Right> <C-o>:echo "No Right for you!"<CR>
nnoremap <Down> :echo "No Down for you!"<CR>
vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!"<CR>
nnoremap <Up> :echo "No Up for you!"<CR>
vnoremap <Up> :<C-u>echo "No Up for you!"<CR>
inoremap <Up> <C-o>:echo "No Up for you!"<CR>
nnoremap <Left> :echo "No Left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$\|node_modules$\|modules$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$'
      \ }
let g:ctrlp_show_hidden = 1
set runtimepath^=~/.vim/bundle/ctrlp.vim  "http://ctrlpvim.github.io/ctrlp.vim/#installation
"https://github.com/maksimr/vim-jsbeautify
map <F3> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <F3> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <F3> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <F3> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <F3> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F3> :call CSSBeautify()<cr>
" Instant Markdown
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0
noremap µ :InstantMarkdownPreview<CR>
" YCM YouCompleteMe (so it will complete markdown files)
let g:ycm_filetype_blacklist = {}
noremap µ :InstantMarkdownPreview<CR>
" YCM YouCompleteMe (so it will complete markdown files)
noremap <C-b> :NERDTreeToggle<CR>
