if has('macunix')
    map ® :so $MYVIMRC<CR>:echoerr '$MYVIMRC Reloaded.'<CR> "osx
    " change cursor shapase based on insert mode
    " http://blog.terriblelabs.com/blog/2013/02/09/stupid-vim-tricks-how-to-change-insert-mode-cursor-shape-with-tmux/
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" "osx
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" "osx
endif
