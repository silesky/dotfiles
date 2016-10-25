if has('unix')
 "LINUX STUFF
endif

if has('macunix')
  noremap ® :so $MYVIMRC<CR>:echoerr '$MYVIMRC Reloaded.'<CR>
  " alt-[ and alt-] to cycle buffers
  noremap ‘ :bnext<CR>
  noremap “ :bprevious<CR>
  "OSX STUFF
endif

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
Plug 'tpope/vim-repeat' "let's you use the dot command with vim surround
Plug 'tpope/vim-surround' "cst
Plug 'avakhov/vim-yaml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript' "syntax hl
Plug 'maksimr/vim-jsbeautify' "f3
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-sleuth'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"detect indent
" sudo npm -g install instant-markdown-d
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'gcorne/vim-sass-lint'
Plug 'marijnh/tern_for_vim'
Plug 'sjl/vitality.vim' "make vim play nicely with iterm and tmux
Plug 'tpope/vim-eunuch' "\:MOVE etc

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
if v:version > 703
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }

call plug#end()
" DIRECTIONS:
" Misc--
" npm install -g eslint sass-lint csslint instant-markdown-d
" YouCompleteMe--
" cd /YouCompleteMe/third_party/ycmd/third_party/
"     git submodule update --init --recursive
"  cd ~/YouCompleteMe/ && ./install.py
" Tern--
" cd /tern_for_vim/ && npm install
" ............................................
" for airline:
set laststatus=2
"allows you to use left or right to nav through completion:
set wildmenu
set wildmode=longest:full,full
" get html indenting working
let g:html_indent_inctags = "html,body,head,tbody"
filetype indent on " html auto indent working
filetype plugin indent on
set autoindent " o goes down and then matches the indentation of the prev line
map <F8> gg=G``:echoerr 'Auto indented.'<CR>
" reload myvimrc with alt-r
noremap <C-k><C-r> :so $MYVIMRC<CR>:echoerr '$MYVIMRC Reloaded.'<CR>
syntax enable
nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>

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

"wrap lines by default
"https://github.com/sheerun/vimrc
set wrap linebreak
set showbreak=" "
"display line next to cursor
" set cursorline
"common mistake of q: instead of :q
map q: :q
" keybindings

map <Esc><Esc> :w<CR>  " double escape to save
" mouse for scrolling and window resizing

set mouse=a
set backspace=indent,eol,start
set clipboard=unnamed
set backupcopy=yes
set noswapfile " no swap file

" copy visually selected text to search
vnoremap / y/<C-R>"

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
" don't show quick list
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers=["sass_lint"]
let g:syntastic_scss_checkers=["sass_lint"]
let g:syntastic_php_phpcs_args='--tab-width=0'
set tabstop=8

noremap <F2> :lprev<CR> "syntastic skip to error
noremap <F3> :lnext<CR> "syntastic skip to error

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

"reload
noremap <F12> :e!<CR>

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
set runtimepath^=~/.vim/bundle/ctrlp.vim  "http://ctrlpvim.github.io/ctrlp.vim/#installation
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
"https://github.com/maksimr/vim-jsbeautify
map <F4> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <F4> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <F4> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <F4> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <F4> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F4> :call CSSBeautify()<cr>
" Instant Markdown
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0
noremap µ :InstantMarkdownPreview<CR>
" YCM YouCompleteMe (so it will complete markdown files)
let g:ycm_filetype_blacklist = {}
noremap <C-k><C-b> :NERDTreeToggle<CR>

" theme explorer
let g:jsx_ext_required = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

