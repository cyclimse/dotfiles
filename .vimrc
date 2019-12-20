"       _                              __ _       
"__   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _ 
"\ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
" \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"  \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                            |___/ 

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'zxqfl/tabnine-vim'
Plug 'dylanaraps/wal.vim'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme wal

set spell
set spelllang+=fr

"Behave like vim instead of vi 
set nocompatible
 
"Attempt to detect filetype/contents so that vim can autoindent etc 
filetype indent plugin on
 
"Enable syntax highlighting 
syntax on
 
"Enable switching from an  unsaved buffer without saving it first and keep an undo history for multiple files. Warn when quitting without saving, and keep swap files.
set hidden
 
"Better command-line completion 
set wildmenu
 
"Show partial commands in the last line of the screen
set showcmd
 
"Highlight searches (use Ctrl+L to temporarily turn off highlighting)
set hlsearch 
nnoremap <C-L> :nohl<CR><C-L>
 
"Use case insensitive search, except when using capital letters
set ignorecase 
set smartcase
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
 
"When opening a new line and no filetype-specific indenting is enabled, keep the same indent as the line you're currently on(Useful for READMEs, etc)
set autoindent
 
"Display the cursor position on the last line of the screen or in the status line of a window
set ruler
 
"Always display the status line, even if only one window is displayed
set laststatus=2
 
"Instead of failing a command because of unsaved changes, instead raise a  dialogue asking if you wish to save changed files 
set confirm
 
"Set the command window height to 2 lines, to avoid many cases of having to press <Enter> to continue  
set cmdheight=2
 
"Display line numbers on the left
set number
 
"Quickly time out on keycodes, but never time out on mappings 
set notimeout ttimeout ttimeoutlen=200
 
"Use F11 to toggle between paste and nopaste
set pastetoggle=<F11>
 
"Enable firefox/google chrome like tab navigation
nmap <C-S-tab> :tabprevious<CR> 
nmap <C-tab> :tabnext<CR> 
map <C-S-tab> :tabprevious<CR> 
map <C-tab> :tabnext<CR> 
imap <C-S-tab> <Esc>:tabprevious<CR>i 
imap <C-tab> <Esc>:tabnext<CR>i 
nmap <C-t> :tabnew<CR> 
imap <C-t> <Esc>:tabnew<CR>
 
"Highlight the current line
set cursorline
 
"Share windows clipboard
set clipboard+=unnamed
 
"Indentation hardtab express settings
set shiftwidth=2 
set softtabstop=2 
set expandtab

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="xelatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}

let g:vimtex_view_method = 'zathura'

"Navigation between splits windows using Alt+arrow

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"https://vim.fandom.com/wiki/Folding
"Allows for indent folding with manual folds

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

"Pressing space while in a fold will open it. In visual mode, pressing space
"will fold it.

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Autoloads the view file so folds are restored on reload

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
