source /home/rr/.config/nvim/vim-plug/plugins.vim

colorscheme gruvbox
syntax on

hi Normal ctermbg=None ctermfg=white 
hi Function ctermfg=white
hi LineNr ctermfg=256
hi Statement ctermfg=red
hi Repeat ctermfg=red
hi String ctermfg=green
hi Conditional ctermfg=red
hi Type ctermfg=yellow
hi Comment ctermfg=256

set nu
set relativenumber
set colorcolumn=80
set cursorline
set smartindent
set incsearch
set nowrap
set tabstop=4
set nohlsearch
set scrolloff=8
set signcolumn=yes
set shiftwidth=4
set expandtab
set laststatus=0
set noruler
set noshowcmd
set noswapfile
set nobackup
set nowb
set fillchars=vert:\│,eob:\ 
set listchars=eol:¬,tab:~.,trail:.,extends:>,precedes:<,space:.
set list
set clipboard=unnamedplus
"let g:ycm_min_num_of_chars_for_completion = 1

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
