set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-textobj-user'
Plugin 'tek/vim-textobj-ruby'
Plugin 'godlygeek/tabular'
Plugin 'gabrielelana/vim-markdown'
Plugin 'lilydjwg/colorizer'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'slim-template/vim-slim'
Plugin 'mattn/gist-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'janko-m/vim-test'
Plugin 'jgdavey/tslime.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'StanAngeloff/php.vim'
Plugin 'ngmy/vim-rubocop'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

:runtime macros/matchit.vim

" Global configs
" set term=screen-256color
" if $TERM =~ '256color'
"    set t_Co=256
" elseif $TERM =~ '^xterm$'
"   set t_Co=256
" endif
let mapleader=","
let localmapleader=","
set updatetime=1000
set hidden                      " Don't abandon buffers moved to the background
set wildmenu                    " Enhanced completion hints in command line
set wildmode=list:longest,full " Complete longest common match and show possible matches
set backspace=eol,start,indent  " Allow backspacing over indent, eol, & start
set complete=.,w,b,u,U,t,i,d    " Do lots of scanning on tab completion
set updatecount=100             " Write swap file to disk every 100 chars
set directory=~/.vim/swap       " Directory to use for the swap file
set diffopt=filler,iwhite   " In diff mode, ignore whitespace changes and align unchanged lines
set history=1000                " Remember 1000 commands
set scrolloff=3                 " Start scrolling 3 lines before the horizontal window border
set visualbell t_vb=            " Disable error bells
set shortmess+=A
" Tabs, spaces
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set smarttab       " Make <tab> and <backspace> smarter
set textwidth=80
set formatoptions-=t formatoptions+=croql
" basic display
set cursorline
set cc=+15
set number
set list    " Display unprintable characters
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
" Local settings
autocmd Filetype php,javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype make setlocal ts=8 sts=8 sw=8
autocmd Filetype mkd setlocal cc=+0
" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"  %    : saves and restores the buffer list
"  '100 : marks will be remembered for up to 30 previously edited files
"  /100 : save 100 lines from search history
"  h    : disable hlsearch on start
"  "500 : save up to 500 lines for each register
"  :1000 : up to 1000 lines of command-line history will be remembered
"  n... : where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:1000,n~/.vim/viminfo
" Undo
set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif
" After 4s of inactivity, check for external file modifications on next keyrpress
au CursorHold,WinEnter,TabEnter * checktime
" Paste
set pastetoggle=<F10>
" Write file when you forget to use sudo
cmap w!! w !sudo tee % >/dev/null
" Other
map <Leader>/ :nohlsearch<cr>
" up/down on displayed lines, not real lines. More useful than painful.
noremap k gk
noremap j gj

" For color sheme
syntax enable
colorscheme molokai
let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized

" For CtrlP
let g:ctrlp_map = '<Leader>.'
let g:ctrlp_custom_ignore = '/\.\|\.o\|\.so'
let g:ctrlp_switch_buffer = 0

" For ACK
nnoremap <Leader>g :Ack

" For NERDTree
nnoremap <C-g> :NERDTreeToggle<cr>

" For Airline
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='solarized'
let g:airline#extensions#hunks#enabled = 0

" For DeleteTrailingWhitespace
autocmd FileType c,cpp,java,php,ruby,python,haml,sass,html,css,javascript,yaml autocmd BufWritePre <buffer> :DeleteTrailingWhitespace

" For YankRing
nnoremap <C-y> :YRShow<cr>
let g:yankring_history_dir = '$HOME/.vim'
let g:yankring_manual_clipboard_check = 0

" For Syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['tex', 'c', 'scss', 'html', 'scala'] }

" For commentary
autocmd FileType php set commentstring=//\ %s

" For markdown
let g:vim_markdown_folding_disabled = 1
let g:markdown_enable_spell_checking = 0

" For Tslime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" For vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>v :TestVisit<CR>
let test#strategy = "tslime"

" For gitgutter
highlight GitGutterAdd ctermbg=darkgreen ctermfg=black
highlight GitGutterChange ctermbg=darkyellow ctermfg=black
highlight GitGutterDelete ctermbg=darkred ctermfg=black
highlight GitGutterChangeDelete ctermbg=gray ctermfg=black
let g:gitgutter_sign_removed = '-'

" For vimwiki
let g:vimwiki_list = [{'path': '~/personal/docs/vimwiki/',
                      \ 'path_html': '~/personal/docs/vimwiki/html_site/'}]
