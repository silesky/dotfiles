if has('unix')
 "LINUX STUFF
endif

if has('macunix')
  " alt-s to toggle
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
Plug 'w0rp/ale'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'easymotion/vim-easymotion'
Plug 'cakebaker/scss-syntax.vim'
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
Plug 'gcorne/vim-sass-lint'
Plug 'marijnh/tern_for_vim'
Plug 'sjl/vitality.vim' "make vim play nicely with iterm and tmux
Plug 'tpope/vim-eunuch' "\:MOVE etc

function! BuildYCM(info)
  if a:info.status == 'installed' || 'updated' || a:info.force
    !./install.sh
  endif
endfunction
if v:version > 703
  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif

function! BuildTern(info)
  if a:info.status == 'installed' || 'updated' || a:info.force
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
" tab bg color
" :highlight Normal ctermfg=DarkGray
" line numbers
set nu

"Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

"wrap lines by default
"https://github.com/sheerun/vimrc
set wrap linebreak
set showbreak=" "

"common mistake of q: instead of :q
map q: :q

" keybindings
inoremap jj <Esc>

" double escape to save
map <ESC><ESC> :w<CR>

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

"ale
nmap <silent> <F2> <Plug>(ale_previous_wrap)
nmap <silent> <F3> <Plug>(ale_next_wrap)
let g:ale_sign_error = '++'
let g:ale_sign_warning = '+'
let g:ale_sign_column_always = 1
let g:ale_linters = {'javascript': ['eslint'] }
"gutter column
:highlight clear SignColumn

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
" set tab
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
noremap <Right> :echo "no right for you!"<CR>
noremap <Down> :echo "No Down for you!"<CR>
noremap <Up> :echo "No Up for you!"<CR>
noremap <Left> :echo "No Left for you!"<CR>
""""""""""""""""""""""""
" CTRLP
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\upload[sS]$|\.yardoc\|public$|log\|tmp$\|node_modules$\|modules$',
      \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.jpg$|\.gif$'
      \ }
let g:ctrlp_cmd = 'call CallCtrlP()'

func! CallCtrlP()
    if exists('s:called_ctrlp')
        CtrlPLastMode
    else
        let s:called_ctrlp = 1
        CtrlPMRU
    endif
endfunc
set runtimepath^=~/.vim/bundle/ctrlp.vim  "http://ctrlpvim.github.io/ctrlp.vim/#installation
let g:ctrlp_map='<c-p>'

" let g:ctrlp_cmd = 'CtrlPMRU'
" don't limit the ctrlp results
let g:ctrlp_match_window = 'min:4,max:72'
"""""""""""""""""""""""""""
" JSBEAUTIFY
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
"""""""""""""""""""""""""""
" Instant Markdown
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0
noremap µ :InstantMarkdownPreview<CR>
" YCM YouCompleteMe (so it will complete markdown files)
let g:ycm_filetype_blacklist = {}
noremap <C-k><C-b> :NERDTreeToggle<CR>
""""""""""""""""""""""""
" theme explorer
let g:jsx_ext_required = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
""""""""""""""""""""""""
noremap !! :set shellcmdflag=-ic<CR>
" EasyMotion
map <Leader> <Plug>(easymotion-prefix)
set guifont=Fira\ Mono
