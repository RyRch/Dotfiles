" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('/home/rr/.config/nvim/autoload/plugged')
    Plug 'gabrielelana/vim-markdown'
    Plug 'ap/vim-css-color'
    Plug 'morhetz/gruvbox'
    "Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/goyo.vim'    
    Plug 'x4m3/vim-epitech'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()
