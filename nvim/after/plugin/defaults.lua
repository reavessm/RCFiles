-- FileTypes
-- {{{

-- Sets commands on file opening based on filetype
-- @param p file type pattern to match on
local function autocmdOnStart(p, c)
  vim.api.nvim_create_autocmd(
  --{ "BufNew", "BufReadPre", "BufRead", "BufNewFile", "BufEnter", "BufWinEnter" },
  --{ "BufNew", "BufRead", "BufNewFile", "CursorHold" },
    { "BufNew", "BufRead", "BufNewFile" },
    {
      pattern = { p }, command = c
    }
  )
end

autocmdOnStart("*.c", "set filetype=c syntax=c")
autocmdOnStart("*.cc", "set filetype=cc syntax=cpp")
autocmdOnStart("*.h", "set filetype=h syntax=c")
autocmdOnStart("*.md", "set filetype=markdown")
autocmdOnStart("*.slide", "set filetype=markdown")
autocmdOnStart("*.mmd", "set filetype=mermaid")
autocmdOnStart("*.service", "set filetype=systemd")
autocmdOnStart("*.sh", "set filetype=sh")
autocmdOnStart("*.go", "set filetype=go")
autocmdOnStart("*.Containerfile", "set filetype=dockerfile")
autocmdOnStart("*.http", "set filetype=http")
-- }}}

-- Must Haves
-- {{{
local set = vim.opt

--vim.cmd [[set hidden]]
set.hidden = true

-- Better command line completion
--vim.cmd [[set wildmenu]]
--vim.cmd [[set wildmode=list:lastused]]
set.wildmenu = true

set.wildmode = "list:lastused"
-- Highlight searches as characters are entered
--vim.cmd [[set hlsearch]]
--vim.cmd [[set incsearch]]
set.hlsearch = true
set.incsearch = true

-- Increased security
--vim.cmd [[set nomodeline]]
--vim.cmd [[set nocompatible]]
set.modeline = false
set.compatible = false

-- Auto indent based on filetype
vim.cmd [[filetype indent plugin on]]

-- Syntax highlighting
--vim.cmd [[set syntax=on]]
set.syntax = "on"
-- }}}

-- Usability Options
-- {{{

-- Use case insensitive search, except when using capital letters
vim.cmd [[set ignorecase]]
vim.cmd [[set smartcase]]

-- Allow backspacing over certain things
vim.cmd [[set backspace=indent,eol,start]]

-- For non-filetype specific files, keep indent of new line same as current line
vim.cmd [[set autoindent]]

-- Stop certain movements from always going to the beginning fo line
vim.cmd [[set nostartofline]]

-- Display the cursor position on the last line of the screen or status window
vim.cmd [[set ruler]]

-- Always display status line, even if only one window is displayed
vim.cmd [[set laststatus=2]]

-- Ask instead of fail when unsaved changes
vim.cmd [[set confirm]]

-- Visual instead of beep
vim.cmd [[set visualbell]]

-- Enable mouse
vim.cmd [[set mouse=a]]

-- Set command window height to 2 lines
vim.cmd [[set cmdheight=2]]

-- Display line numbers to the left
vim.cmd [[set number]]

-- Encoding
vim.cmd [[set encoding=utf-8]]

-- Highlight matching [{()}]
--vim.cmd [[set showmatch]]
set.showmatch = true

-- Allow cursor change in Tmux
vim.cmd [[
if exists ('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
]]

vim.cmd [[autocmd FileType go setlocal makeprg=golangci-lint\ run\ %\ &&\ go\ run\ %\ &&\ sleep\ 3]]
vim.cmd [[autocmd FileType rust setlocal makeprg=cargo\ run\ &&\ sleep\ 3]]

-- Highlight when going over 80 columns
vim.api.nvim_command("highlight ColorColumn ctermfg=white ctermbg=darkgray guifg=white guibg=darkgray")
--vim.api.nvim_command("call matchadd('ColorColumn', '\%81v', 100)")
vim.cmd [[ call matchadd('ColorColumn', '\%81v', 100) ]]

-- Highlight unneeded spaces
vim.api.nvim_command("set listchars=tab:>~,nbsp:_,trail:.,extends:>")
vim.api.nvim_command("set list")

-- }}}

-- Indentation Options
-- {{{
vim.api.nvim_command("set shiftwidth=2")
vim.api.nvim_command("set softtabstop=2")
vim.api.nvim_command("set tabstop=2")
vim.api.nvim_command("set expandtab")
vim.api.nvim_command("autocmd FileType markdown set shiftwidth=2 softtabstop=2 tabstop=2")
vim.api.nvim_command("autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0")

-- Textwrap
-- vim.api.nvim_command("set wrap")
vim.api.nvim_command("set nowrap")
vim.api.nvim_command("set textwidth=0")
vim.api.nvim_command(
  "autocmd BufNew,BufRead *.cc,*.h,*.cpp,*.c,*.java,*.sh,*.python,*.py,*.html,*.js,*.css,*.php,*.go,*.rs setlocal textwidth=79")

-- Folding
vim.api.nvim_command("set foldmethod=marker")
vim.api.nvim_command("autocmd FileType yaml set foldmethod=indent")
vim.api.nvim_command("autocmd FileType html set foldmethod=indent")
vim.api.nvim_command("autocmd FileType gohtmltmpl set foldmethod=indent")
vim.api.nvim_command("autocmd FileType c set foldmethod=syntax")
vim.api.nvim_command("autocmd FileType rust set foldmethod=syntax")
vim.api.nvim_command("autocmd FileType go set foldmethod=expr")
vim.api.nvim_command("autocmd FileType go set foldexpr=nvim_treesitter#foldexpr()")
vim.api.nvim_command("autocmd FileType markdown set foldmethod=expr")
vim.api.nvim_command("autocmd FileType markdown set foldexpr=nvim_treesitter#foldexpr()")
--vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
--vim.api.nvim_command("autocmd FileType markdown set foldmethod=expr")
--vim.api.nvim_command("autocmd FileType markdown set foldexpr=NestedMarkdownFolds()")
-- }}}

vim.cmd [[set shortmess=A]]
vim.opt.termguicolors = true
