
set nocompatible " be iMproved

" For vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Dependencies of snipmate

" Caching
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'

"Ruby and rails Snippets
"Bundle 'honza/vim-snippets'

Bundle 'sickill/vim-sunburst'
" Good looking bottom :) 

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'slim-template/vim-slim'
Plugin 'mileszs/ack.vim'
"A Vim plugin which shows a git diff in the 'gutter' (sign column)
"Bundle 'airblade/vim-gitgutter'

Plugin 'https://github.com/berkos/vim-haml.git'
Plugin 'marcopaganini/termschool-vim-theme'
"Johns reccomendation, shows | |
Plugin 'Yggdroot/indentLine'

"Fancy Bar 
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" The Same
"Bundle 'bling/vim-airline'

" Git tools
"Bundle 'tpope/vim-fugitive'

" Dependency managment (Vundle)
"Bundle 'gmarik/vundle'

" Rails :/
"Bundle 'tpope/vim-rails.git'
" Snippets for our use :)
"Bundle 'garbas/vim-snipmate'
" Commenting and uncommenting stuff

" Vim Ruby
Bundle 'vim-ruby/vim-ruby'
" Surround your code :)
Bundle 'tpope/vim-surround'
" Every one should have a pair (Autogenerate pairs for "{[( )
Bundle 'jiangmiao/auto-pairs'
" Tab completions
Bundle 'ervandew/supertab'
" CoffeeScript syntax
Bundle 'kchmck/vim-coffee-script'
" Fuzzu finder for vim (CTRL+P)
Bundle 'kien/ctrlp.vim'
" Ruby Tests
Bundle 'skalnik/vim-vroom'
" Easy motion for easy motion
"Bundle 'Lokaltog/vim-easymotion'
" Running tests in tmux session
Bundle 'tpope/vim-dispatch'

"Bundle 'mustache/vim-mustache-handlebars'

" ----------- My Stuff  ------
"
nnoremap œ :tabprevious<CR>
nnoremap ∑ :tabnext<CR>
nnoremap † :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
" copy like normal
vnoremap <C-c> :w !pbcopy<CR><CR>

set splitright
set relativenumber

map  ,t  <C-p>
let NERDTreeMapPreview='gt'
let NERDTreeShowHidden=1
let g:indentLine_color_term = 239
let g:ctrlp_max_files=0

map <C-n> :NERDTreeToggle<CR>

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif


"set grepprg=ack " Set ACK as a default grep
set tags=./tags; " Set tags directory
set autoindent " Auto indention should be on


let g:neocomplete#enable_at_startup = 1

filetype plugin indent on

" Ruby stuff: Thanks Ben :)
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
	" Clear old autocmds in group
	autocmd!
	" autoindent with two spaces, always expand tabs
	autocmd FileType ruby,eruby,yaml,markdown set ai sw=2 sts=2 et
augroup END
" ================

" Syntax highlighting and theme

syntax enable

" Configs to make Molokai look great
colorscheme sunburst
set background=dark
"highlight Normal guibg=black guifg=white
"let g:molokai_original=1
"let g:rehash256=1
set t_Co=256

":highlight Directory guifg=#FF0000 ctermfg=blue

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Lovely linenumbers
set nu


set backspace=2 " make backspace work like most other apps

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
"map <leader>p :bp<CR> " \p previous buffer
"map <leader>n :bn<CR> " \n next buffer
"map <leader>d :bd<CR> " \d delete buffer

"let g:vroom_map_keys = 0
"let g:vroom_use_dispatch = 1
let g:vroom_use_zeus = 1
let g:vroom_ignore_color_flag = 1
"let g:vroom_use_vimshell = 1
let g:vroom_rspec_version="3.x"

map <Leader>c :call vroom#RunTestFile()<CR>
map <Leader>s :call vroom#RunNearestTest()<CR>
map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \r to jump to related file
"map <leader>E :Explore .<cr> " \E to open file explorer in root
"map <leader>e :Explore<cr> " \e to open file explorer in current dir

let g:airline_theme='luna'
let g:airline_powerline_fonts=1
set laststatus=2


au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" highlight the current line
set cursorline
" Highlight active column

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
""""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
""""""""""""""""""""""""""""""""""""""""
if isdirectory($HOME . '/.vim/backup') == 0
	:silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
	:silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.


autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
	" undofile - This allows you to use undos after exiting and restarting
	" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
	" :help undo-persistence
	" This is only present in 7.3+
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif


" Increment numbers
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
