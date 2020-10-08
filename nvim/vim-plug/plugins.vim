" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('/home/ryan/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    " Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Autocomplete 
    " Plug 'git@github:ycm-core/YouCompleteMe.git'
    " C/C++
    " Plug 'lyuts/vim-tags'
    " Theme
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'joshdick/onedark.vim'      
call plug#end()
	
