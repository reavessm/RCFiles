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
autocmd BufNew,BufRead,BufNewFile *.sh set filetype=sh
" }}}

" Plugins
" {{{

call plug#begin('~/.vim/plugInDir')

"File Explorer
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTree' }
"Spell Checker
"Plug 'vim-scrips/SpellCheck'

" Markdown Previewer
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" LaTeX Previewer
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" File Completion
"Plug 'https://github.com/Valloric/YouCompleteMe'

" Colors
Plug 'flazz/vim-colorschemes'

" Tab Completion
"Plug 'ervandew/supertab'

" Snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Fuzzy Finder
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/fzf'

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
"Plug 'gregsexton/gitv', {'on': ['Gitv']}
"Plug 'tpope/vim-fugitive'
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

"Plug 'vim-scripts/Conque-GDB'

" Simple todo list in side bar
Plug 'reavessm/vimtodo'

" Git add, commit, and push all in one
"Plug 'peterhurford/send.vim'

" Nginx syntax
Plug 'chase/nginx.vim'

" Syntax
Plug 'vim-syntastic/syntastic'

" Rust
Plug 'rust-lang/rust'

" Tags
Plug 'majutsushi/tagbar'

" HTML Tags
"Plug 'sukima/xmledit'
"Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" Golang
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Spooky Skeletons
Plug 'reavessm/vim-skeleton'

" Beautify
Plug 'zeekay/vim-beautify'

" Vim+TMUX
Plug 'tpope/vim-dispatch'

" Math
"Plug 'nixon/vmath.vim'

" Move stuff
"Plug 'atweiden/vim-dragvisualas'

" C/C++ Debugger
Plug 'puremourning/vimspector'

call plug#end()

"let g:ycm_global_ycm_extra_conf="~/.vim/plugInDir/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
"let g:ycm_max_diagnostics_to_display=0
"let g:SuperTabeDefaultCompletionType="context"
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
let g:gitgutter_highlight_lines=1
"let g:gitgutter_sign_added=emoji#for('small_blue_diamond')
"let g:gitgutter_sign_modified=emoji#for('small_orange_diamond')
"let g:gitgutter_sign_removed=emoji#for('small_red_triangle')
"let g:gitgutter_sign_modified_removed=emoji#for('collision')
let g:gitgutter_highlight_linenrs=1
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=0
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=[".*\.swp"]
"let g:ConqueTerm_Color = 2 " 1 -> Strip color after 200 lines, 2 -> always with color
"let g:ConqueTerm_CloseOnEnd = 1 " Close Conque when program ends
"let g:ConqueTerm_StartMessage = 0
let g:go_template_autocreate=0 " We don't need this with vim-skeleton
let g:go_def_mapping_enabled=0
let g:go_highlight_types=1
let g:go_highlight_extra_types=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_fields=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_debug_windows = {
      \ 'vars': 'rightbelow 60vnew',
      \ 'stack': 'rightbelow 10new',
      \ 'out': 'bot 10new',
      \ }
let g:go_debug_log_output = 'debugger'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go', 'cc=cpp', 'c',]

function! g:Open_browser(url)
  exec "Start! firefox --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'


let g:user_emmet_leader_key=','

set completefunc=emoji#complete

let g:markdown_fold_override_foldtext = 0

" }}}

" MUST HAVES
" {{{

set hidden
"set confirm
"set autowriteall
"
" Better Command Line Completion
set wildmenu
set wildmode=list:lastused

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

autocmd FileType go setlocal makeprg=golint\ %\ &&\ go\ run\ %\ &&\ sleep\ 3

set mmp=2048

" }}}

" Plugin Options
" {{{

" Coc has problems with backups
set nobackup
set nowritebackup

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the sign column
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

function! StatusLineGitBlame() abort
  let blame = substitute(get(b:, 'coc_git_blame', ''), ").*$", ")", "")
  return winwidth(0) > 120 ? @% . ' '  . blame : @%
endfunction
autocmd User CocGitStatusChange call StatusLineGitBlame()

let g:airline_section_c = "%{StatusLineGitBlame()}"

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_git_status','coc_current_function','')}
"set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{blame}
"set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

"autocmd FileType markdown set foldmarker=<!---,-->
autocmd FileType yaml set foldmethod=indent
autocmd FileType html set foldmethod=indent
autocmd FileType gohtmltmpl set foldmethod=indent
autocmd FileType go set foldmethod=syntax
autocmd FileType markdown set foldmethod=expr
autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

" }}}

" Colors
" {{{
" Color Scheme
set t_Co=256
set background=dark
"silent! colorscheme monokai
"silent! colorscheme molokai
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

hi Normal ctermfg=Gray ctermbg=NONE guifg=Gray guibg=#00002A
hi Folded ctermfg=DarkGray ctermbg=NONE 

" Fix GitGutter Highlighting
hi DiffChange term=bold ctermbg=24 guibg=#2B5B77 ctermfg=Black
hi DiffAdd term=bold ctermbg=58 guibg=#4C4E39 ctermfg=Black

let g:airline_theme='bubblegum'
" }}}

" Custom Keybindings
" {{{

function! s:align()
  let p = '^\s*|\s.*|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|', column).'\s\{-\}'.repeat('.', position),'ce',line('.'))
  endif
endfunction

map <F6> :setlocal spell! spelllang=en_us<CR>

inoremap {{ {<CR>}<Esc>ko
inoremap (( ()<++><Esc>F)i
inoremap [[ []<++><Esc>F]i
inoremap <c-l> <Esc>/<++><CR>:noh<CR>ca<


" Debug mappings
autocmd FileType * nnoremap <F5> :call vimspector#Launch()<CR>
autocmd FileType * nnoremap <F6> :VimspectorReset<CR>
autocmd FileType * nnoremap <F7> :call vimspector#Continue()<CR>
autocmd FileType * nnoremap <F9> :call vimspector#ToggleBreakpoint()<CR>
autocmd FileType * nnoremap <F10> :call vimspector#StepOver()<CR>
autocmd FileType * nnoremap <F11> :call vimspector#StepInto()<CR>

" Needs to be below generic mappings to overwrite
autocmd FileType go nnoremap <F5> :GoDebugStart<CR>
autocmd BufNew,BufNewFile,BufRead *_test.go nnoremap <F5> :GoDebugTest<CR>
autocmd FileType go nnoremap <F6> :GoDebugStop<CR>
autocmd FileType go nnoremap <F9> :GoDebugBreakpoint<CR>
autocmd FileType go nnoremap <F10> :GoDebugStep<CR>
autocmd FileType go nnoremap <F11> :GoDebugStepOut<CR>
"autocmd FileType go nnoremap <F5> :GoDebugStart<CR>
"autocmd BufNew,BufNewFile,BufRead *_test.go nnoremap <F5> :GoDebugTest<CR>
"autocmd Filetype go nnoremap <F6> :GoDebugStop<CR>
"autocmd FileType go nnoremap <F9> :GoDebugBreakpoint<CR>
"autocmd FileType go nnoremap <F10> :GoDebugStep<CR>
"autocmd FileType go nnoremap <F11> :GoDebugStepOut<CR>

" Insert markdown specific stuff
autocmd FileType markdown inoremap :i ![](<++>)<Space><++><Esc>F[a
autocmd FileType markdown inoremap <c-i> <Esc>Bi![<Esc>Ea]()<Esc>i
autocmd FileType markdown inoremap :a [](<++>)<Space><++><Esc>F[a
autocmd FileType markdown inoremap <c-a> <Esc>Bi[<Esc>Ea]()<Esc>i
autocmd FileType markdown inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a

" Un-fuck stuff
autocmd FileType markdown inoremap <Tab> <Tab>
inoremap ,i ,i
"autocmd FileType markdown inoremap <Space><Esc> <Esc>f+ca<
"autocmd FileType cc inoremap <Space><Esc> <Esc>j0f+ca<

" for insert mode
imap <silent> <F1> <Plug>MarkdownPreview
imap <silent> <F2> <Plug>MarkdownPreviewStop
" for normal mode
nmap <silent> <F1> <Plug>MarkdownPreview
nmap <silent> <F2> <Plug>MarkdownPreviewStop

" Javadoc stuff
autocmd FileType cc map ,f  i/**<ESC>:read !echo \*<CR>:read !echo \* @param<CR>:read !echo \* @returns \<++\><CR>:read !echo \* @brief \<++\><CR>:read !echo \* @detail \<++\><CR>:read !echo \*\/<CR>j2f:lviwykkkkkp0li<Space><Esc>jA<Space>

autocmd FileType cc map ,d  i/**<ESC>:read !echo \* @class % \| cut -d '.' -f1<CR>:read !echo \* @author Stephen M. Reaves<CR>:read !echo \* @file  %<CR>:read !echo \* @date $(date "+\%b \%d, \%Y")<CR>:read !echo \* @brief<CR>:read !echo \*\/<CR>kA<Space>

autocmd FileType h map ,d  i/**<ESC>:read !echo \* @class % \| cut -d '.' -f1<CR>:read !echo \* @author Stephen M. Reaves<CR>:read !echo \* @headerfile  %<CR>:read !echo \* @date $(date "+\%b \%d, \%Y")<CR>:read !echo \*\/<CR>

" Copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>:silent !xclip -selection clipboard ~/.vimbuffer<CR>:redraw!<CR>
nmap <C-c> :'<,'>w! ~/.vimbuffer<CR>:silent !xclip -selection clipboard ~/.vimbuffer<CR>:redraw!<CR>
" Paste from buffer
map <C-v> :read !cat ~/.vimbuffer<CR>

" git add current file
nnoremap ga :silent Git add %<CR>

set updatetime=100

" Move lines up and down
nnoremap <c-j> ddp 
nnoremap <c-k> ddkP

" Line up eqaul signs ('=')
autocmd FileType !go vnoremap <c-t> :'<,'>Tabularize /=<CR>

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

" Bash vim closing
autocmd FileType sh inoremap zi <Esc>0i#{{{<CR>#}}}<Esc>kA<CR>

autocmd FileType sh inoremap {{ ${}<++><Esc>F{a

" Highlight when going over 80 columns
highlight ColorColumn ctermfg=white ctermbg=darkgray
autocmd FileType markdown highlight ColorColumn ctermbg=black
call matchadd('ColorColumn', '\%81v', 100)

" Highlight uneccesary spaces
set listchars=tab:>~,nbsp:_,trail:.
"set listchars=tab:    ,nbsp:_,trail:.
set list

" Set Presentation Mode
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <PageDown> :n<CR>
  nnoremap <buffer> <Left> :N<CR>
  nnoremap <buffer> <PageUp> :N<CR>
  nnoremap <buffer> <F5> :qa<CR>
  set nolist
  set filetype=markdown
  cnoremap x xa
  cnoremap w wa
  cnoremap q qa

  highlight Normal ctermbg=black ctermfg=white

  " Hide stuff
  set relativenumber! number! showmode! showcmd! hidden! ruler!

  if !exists('#goyo')
    Goyo
  endif " Test
endfunction     



" Toggle GitGutter Highlighting
nnoremap <C-h> :GitGutterLineHighlightsToggle<CR>
inoremap <C-h> <Esc>:GitGutterLineHighlightsToggle<CR>i

let g:transparency=1
" Toggle transparency
function ToggleTransparency()
  let g:transparency = !g:transparency
  if g:transparency
    hi Normal ctermbg=NONE
    hi Folded ctermfg=Black ctermbg=NONE
  else
    hi Normal ctermbg=Black
    hi Folded ctermfg=Gray ctermbg=Black
  endif
endfunction

nnoremap <c-t> :execute ToggleTransparency()<CR>


nnoremap <C-e> "eyiw:GoIfErr<CR>?err<CR>viw"epj$viw"ep:nohls<CR>

nnoremap <C-u> :GitGutterUndoHunk<CR>
nmap gC <Plug>(coc-git-nextconflict)<CR>

nnoremap gF 100[{0
nnoremap gD 100[{0z<CR>

autocmd FileType markdown nnoremap <C-d> :read !echo -n '\# ' && date -I<CR>
" }}}

" Defaults
" {{{
set foldtext=foldtext() " Reset fold text to default
" }}}


au BufRead,BufNewFile * syntax match myBoldComment '\*\*\w*\*\*'
highlight myBoldComment cterm=bold gui=bold
au BufRead,BufNewFile * syntax match myItalicComment '\*\w*\*'
highlight myItalicComment cterm=italic gui=italic
