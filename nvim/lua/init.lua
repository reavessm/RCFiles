require('keybindings')
require('dapui').setup({
  layouts = {
    {
      elements = {
        { id = 'scopes', size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, --columns
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25%
      position = "bottom",
    }
  }
})

--require("telescope").load_extension "packer"

-- Color
-- {{{
vim.g.catpuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    coc_nvim = true,
    --coc_nvim = false,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = true,
    },
    gitgutter = true,
    markdown = true,
    notify = true,
  }
})
vim.cmd [[colorscheme catppuccin]]
-- }}}

-- FileTypes
-- {{{
vim.cmd [[autocmd BufNew,BufRead,BufNewFile *.cc set filetype=cc]]
vim.cmd [[autocmd BufNew,BufRead,BufNewFile *.cc set syntax=cpp]]
vim.cmd [[autocmd BufNew,BufRead,BufNewFile *.h set filetype=h]]
vim.cmd [[autocmd BufNew,BufRead,BufNewFile *.h set syntax=cpp]]
vim.cmd [[autocmd BufNew,BufRead,BufNewFile *.md set filetype=markdown]]
vim.cmd [[autocmd BufNew,BufRead,BufNewFile *.service set filetype=systemd]]
vim.cmd [[autocmd BufNew,BufRead,BufNewFile *.sh set filetype=sh]]
-- }}}

-- Must Haves
-- {{{
vim.cmd [[set hidden]]

-- Better command line completion
vim.cmd [[set wildmenu]]
vim.cmd [[set wildmode=list:lastused]]

-- Highlight searches as characters are entered
vim.cmd [[set hlsearch]]
vim.cmd [[set incsearch]]

-- Increased security
vim.cmd [[set nomodeline]]
vim.cmd [[set nocompatible]]

-- Auto indent based on filetype
vim.cmd [[filetype indent plugin on]]

-- Syntax highlighting
vim.cmd [[set syntax=on]]
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
vim.cmd [[set showmatch]]

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
vim.api.nvim_command("set listchars=tab:>~,nbsp:_,trail:.")
vim.api.nvim_command("set list")



-- }}}

-- Indentation Options
-- {{{
vim.api.nvim_command("set shiftwidth=2")
vim.api.nvim_command("set softtabstop=2")
vim.api.nvim_command("set tabstop=2")
vim.api.nvim_command("set expandtab")
vim.api.nvim_command("autocmd FileType markdown set shiftwidth=4 softtabstop=4 tabstop=4")
vim.api.nvim_command("autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0")

-- Textwrap
vim.api.nvim_command("set wrap")
vim.api.nvim_command("set textwidth=0")
vim.api.nvim_command("autocmd BufNew,BufRead *.cc,*.h,*.cpp,*.c,*.java,*.sh,*.python,*.py,*.html,*.js,*.css,*.php,*.go,*.rs setlocal textwidth=79")

-- Folding
vim.api.nvim_command("set foldmethod=marker")
vim.api.nvim_command("autocmd FileType yaml set foldmethod=indent")
vim.api.nvim_command("autocmd FileType html set foldmethod=indent")
vim.api.nvim_command("autocmd FileType gohtmltmpl set foldmethod=indent")
vim.api.nvim_command("autocmd FileType go set foldmethod=syntax")
vim.api.nvim_command("autocmd FileType markdown set foldmethod=expr")
--vim.api.nvim_command("autocmd FileType markdown set foldmethod=NestedMarkdownFolds()")
vim.api.nvim_command("autocmd FileType markdown set foldexpr=NestedMarkdownFolds()")

vim.g.transparency=1
vim.api.nvim_command("hi Normal ctermbg=NONE guibg=None")
vim.api.nvim_command("hi Folded ctermfg=Gray ctermbg=None guifg=Gray guibg=None")
-- Toggle transparency
vim.cmd [[
function! ToggleTransparency()
  let g:transparency = !g:transparency
  if g:transparency
    hi Normal ctermbg=NONE guibg=None
    hi Folded ctermfg=Black ctermbg=NONE guifg=Gray guibg=None
  else
    hi Normal ctermbg=Black guibg=Black
    hi Folded ctermfg=Gray ctermbg=Black guifg=Gray guibg=Black
  endif
endfunction
]]
-- }}}

-- Coc Options
-- {{{
vim.cmd [[set nobackup]]
vim.cmd [[set nowritebackup]]
vim.cmd [[set updatetime=300]]
vim.cmd [[set signcolumn=yes]]
-- }}}

vim.cmd [[set shortmess=A]]
