"""""""""""""""""""""""""""""""""""""""
" Stephen's Vim Runtime Configuration "
"""""""""""""""""""""""""""""""""""""""

" Filetypes
" {{{
autocmd BufNew,BufRead,BufNewFile *.cc set filetype=cc
autocmd BufNew,BufRead,BufNewFile *.cc set syntax=cpp
autocmd BufNew,BufRead,BufNewFile *.h set filetype=h
autocmd BufNew,BufRead,BufNewFile *.h set syntax=cpp
autocmd BufNew,BufRead,BufNewFile *.md set filetype=markdown
autocmd BufNew,BufRead,BufNewFile *.service set filetype=systemd

" }}}

" Plugins
" {{{

call plug#begin('~/.vim/plugInDir')

"File Explorer
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTree' }
"Spell Checker
"Plug 'vim-scrips/SpellCheck'

" Markdown Previewer
Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'

" LaTeX Previewer
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" File Completion
"Plug 'https://github.com/Valloric/YouCompleteMe'

" Colors
Plug 'flazz/vim-colorschemes'

" Tab Completion
Plug 'ervandew/supertab'

" Snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Fuzzy Finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'

" Lineup things
" Useful for markdown
Plug 'godlygeek/tabular'

" Comment blocks
Plug 'tomtom/tcomment_vim'

" Test Suites
Plug 'janko-m/vim-test'

" Icons
Plug 'ryanoasis/nerd-fonts'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Grammer check
Plug 'vim-scripts/LanguageTool'

" Git
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Emojis
Plug 'junegunn/vim-emoji'

" Comment out blocks
Plug 'scrooloose/nerdcommenter'

" Center text
Plug 'junegunn/goyo.vim'

" i3 syntax
Plug 'PotatoesMaster/i3-vim-syntax'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

Plug 'vim-scripts/Conque-GDB'

" Simple todo list in side bar
Plug 'reavessm/vimtodo'

" Git add, commit, and push all in one
Plug 'peterhurford/send.vim'

" Nginx syntax
Plug 'chase/nginx.vim'

call plug#end()

let g:ycm_global_ycm_extra_conf="~/.vim/plugInDir/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
let g:SuperTabeDefaultCompletionType="context"
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:gitgutter_highlight_lines=0
"let g:gitgutter_sign_added=emoji#for('small_blue_diamond')
"let g:gitgutter_sign_modified=emoji#for('small_orange_diamond')
"let g:gitgutter_sign_removed=emoji#for('small_red_triangle')
"let g:gitgutter_sign_modified_removed=emoji#for('collision')
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=0
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let NERDTreeShowHidden=1
let g:ConqueTerm_Color = 2 " 1 -> Strip color after 200 lines, 2 -> always with color
let g:ConqueTerm_CloseOnEnd = 1 " Close Conque when program ends
let g:ConqueTerm_StartMessage = 0

set completefunc=emoji#complete

" }}}

" MUST HAVES
" {{{

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

" Set nocompatible to ward off unexpected things
set nocompatible

" Attempts to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
filetype indent plugin on

" Enable Syntax Highlighting
syntax on

" }}}

"Usability Options
" {{{


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

" }}}

" Indentation Options
" {{{
" Change tab to 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
autocmd FileType markdown set shiftwidth=4
autocmd FileType markdown set softtabstop=4
autocmd FileType markdown set tabstop=4
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" Textwrap, width based on filetype
set wrap
set textwidth=0
autocmd BufNew,BufRead *.cc,*.h,*.cpp,*.c,*.java,*.sh,*.python,*.py,*.html,*.js,*.css,*.php setlocal textwidth=79

" Folding
set foldmethod=marker

" }}}

" Colors
" {{{
" Color Scheme
set t_Co=256
set background=dark
"silent! colorscheme monokai
"silent! colorscheme Revolution
silent! colorscheme Tomorrow-Night
"silent! colorscheme antares
"silent! colorscheme asu1dark
"silent! colorscheme behelit
"silent! colorscheme blaquemagick
"silent! colorscheme blueprint
"silent! colorscheme cabin
"silent! colorscheme detailed
"silent! colorscheme dracula
"silent! colorscheme dual
"silent! colorscheme elda
"silent! colorscheme hybrid
"silent! colorscheme luna-term
"silent! colorscheme radicalgoodspeed
"silent! colorscheme skittles_dark
"silent! colorscheme up
"silent! colorscheme vj
"silent! colorscheme random

let g:airline_theme='bubblegum'
" }}}

" Custom Keybindings
" {{{

map <F6> :setlocal spell! spelllang=en_us<CR>

inoremap {{ {<CR>}<Esc>ko
inoremap (( ()<++><Esc>F)i
inoremap [[ []<++><Esc>F]i
inoremap <c-l> <Esc>/<++><CR>:noh<CR>ca<

" Insert markdown specific stuff
autocmd FileType markdown inoremap :i ![](<++>)<Space><++><Esc>F[a
autocmd FileType markdown inoremap <c-i> <Esc>Bi![<Esc>Ea]()<Esc>i
autocmd FileType markdown inoremap :a [](<++>)<Space><++><Esc>F[a
autocmd FileType markdown inoremap <c-a> <Esc>Bi[<Esc>Ea]()<Esc>i
"autocmd FileType markdown inoremap <Space><Esc> <Esc>f+ca<
"autocmd FileType cc inoremap <Space><Esc> <Esc>j0f+ca<

nmap <silent> <F8> <Plug>MarkdownPreview     " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview     " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview " for insert mode

" Javadoc stuff
autocmd FileType cc map ,f  i/**<ESC>:read !echo \*<CR>:read !echo \* @param<CR>:read !echo \* @returns \<++\><CR>:read !echo \* @brief \<++\><CR>:read !echo \* @detail \<++\><CR>:read !echo \*\/<CR>j2f:lviwykkkkkp0li<Space><Esc>jA<Space>

autocmd FileType cc map ,d  i/**<ESC>:read !echo \* @class % \| cut -d '.' -f1<CR>:read !echo \* @author Stephen M. Reaves<CR>:read !echo \* @file  %<CR>:read !echo \* @date $(date "+\%b \%d, \%Y")<CR>:read !echo \* @brief<CR>:read !echo \*\/<CR>kA<Space>

autocmd FileType h map ,d  i/**<ESC>:read !echo \* @class % \| cut -d '.' -f1<CR>:read !echo \* @author Stephen M. Reaves<CR>:read !echo \* @headerfile  %<CR>:read !echo \* @date $(date "+\%b \%d, \%Y")<CR>:read !echo \*\/<CR>

" Copy to buffer
vmap <C-c> :'<'>w! ~/.vimbuffer<CR>
nmap <C-c> :'<'>w! ~/.vimbuffer<CR>
" Paste from buffer
map <C-v> :read !cat ~/.vimbuffer<CR>

" git add current file
nnoremap ga :silent Git add %<CR>

set updatetime=100

" Move lines up and down
nnoremap <c-j> ddp 
nnoremap <c-k> ddkP

" Line up eqaul signs ('=')
vnoremap <c-t> :'<,'>Tabularize /=<CR>

command! -nargs=* RunSilent
      \ | execute ':silent !'.'<args>'
      \ | execute ':redraw!'
nnoremap <c-p> :RunSilent pandoc -o /tmp/vim-pandoc-out.pdf %<CR>
nnoremap <c-z> :RunSilent pdfToggle  /tmp/vim-pandoc-out.pdf &<CR>

" Minimize
"vnoremap <c-m> :'<,'>join<CR>
"nnoremap <c-m> :0,$join<CR>

" Query-based code snippets from Stack Overflow
"vnoremap <c-h> :'<,'>!howdoi `cat`<CR>
"nnoremap <c-h> V:'<,'>!howdoi `cat`<CR>
"inoremap <c-h> <Esc>V:'<,'>!howdoi `cat`<CR>

" }}}
