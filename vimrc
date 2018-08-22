" ~/.vimrc created from vim.wikia.com/wiki/Example_vimrc

autocmd BufNew,BufRead,BufNewFile *.cc set filetype=cc
autocmd BufNew,BufRead,BufNewFile *.cc set syntax=cpp
autocmd BufNew,BufRead,BufNewFile *.h set filetype=h
autocmd BufNew,BufRead,BufNewFile *.h set syntax=cpp
autocmd BufNew,BufRead,BufNewFile *.md set filetype=markdown

" Set nocompatible to ward off unexpected things
set nocompatible

" Attempts to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
filetype indent plugin on

" Enable Syntax Highlighting
syntax on

"------------------------------------------------------------------------------
"Plugins

call plug#begin('~/.vim/plugInDir')

"File Explorer
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTree' }
"Spell Checker
"Plug 'vim-scrips/SpellCheck'

" Markdown Previewer
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" File Completion
Plug 'https://github.com/Valloric/YouCompleteMe'

call plug#end()



"------------------------------------------------------------------------------
" MUST HAVES


set hidden
"set confirm
"set autowriteall
"
" Better Command Line Completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches as characters are entered
set hlsearch
set incsearch

" Increased security
set nomodeline

"------------------------------------------------------------------------------
"Usability Options


" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, linebreaks and start of insert action
set backspace=indent,eol,start

" For non-filetype specific files, keep indent of new line same as current
" line
set autoindent

" Stop certain movements from always going to beginning of line
set nostartofline

" Display the cursor position on the Last Line of the screen or status window
set ruler

" Always display status line, even if only one window is displayed
set laststatus=2

" Ask instead of fail when unsaved changes
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of a mouse
set mouse=a

" Set command window height to 2 lines.
set cmdheight=2

" Display line numbers to the left
set number

" Encoding
set encoding=utf-8

" Highlight matching [{()}]
set showmatch

" Allows cursor change in Tmux
if exists ('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"------------------------------------------------------------------------------
" Indentation Options
"
" Change tab to 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
autocmd FileType markdown set shiftwidth=4
autocmd FileType markdown set softtabstop=4
autocmd FileType markdown set tabstop=4

" Textwrap, width based on filetype
set wrap
set textwidth=0
autocmd BufNew,BufRead *.cc,*.h,*.cpp,*.c,*.java,*.sh,*.python,*.py,*.html,*.js,*.css,*.php setlocal textwidth=79


"------------------------------------------------------------------------------
" Colors
"
" Color Scheme
set t_Co=256
set background=dark

"-------------------------------------------------------------------------------
" Custom Keybindings

map <F6> :setlocal spell! spelllang=en_us<CR>

" Insert markdown specific stuff
autocmd FileType markdown inoremap :i ![](<++>)<Space><++><Esc>F[a
autocmd FileType markdown inoremap :a [](<++>)<Space><++><Esc>F[a
autocmd FileType markdown inoremap <Space><Esc> <Esc>f+ca<
autocmd FileType cc inoremap <Space><Esc> <Esc>jf+ca<

nmap <silent> <F8> <Plug>MarkdownPreview     " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview     " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview " for insert mode

" Javadoc stuff
autocmd FileType cc  map ,f  i/**<ESC>:read !echo \*<CR>:read !echo \* @param<CR>:read !echo \* @returns \<++\><CR>:read !echo \* @brief \<++\><CR>:read !echo \* @detail \<++\><CR>:read !echo \*\/<CR>j2f:lviwykkkkkp0li<Space><Esc>jA<Space>

autocmd FileType cc  map ,d  i/**<ESC>:read !echo \* @class % \| cut -d '.' -f1<CR>:read !echo \* @author Stephen M. Reaves<CR>:read !echo \* @file  %<CR>:read !echo \* @date $(date "+\%b \%d, \%Y")<CR>:read !echo \* @brief<CR>:read !echo \*\/<CR>kA<Space>

autocmd FileType h map ,d  i/**<ESC>:read !echo \* @class % \| cut -d '.' -f1<CR>:read !echo \* @author Stephen M. Reaves<CR>:read !echo \* @headerfile  %<CR>:read !echo \* @date $(date "+\%b \%d, \%Y")<CR>:read !echo \*\/<CR>

" Copy to buffer
vmap <C-c> :'<'>w! ~/.vimbuffer<CR>
nmap <C-c> :'<'>w! ~/.vimbuffer<CR>
" Paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

