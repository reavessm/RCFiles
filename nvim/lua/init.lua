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
require('dap-go').setup()
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.after.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.after.event_exited["dapui_config"] = function()
  dapui.close()
end

require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "lua", "rust", "go" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})


--require("telescope").load_extension "packer"
--require("telescope")
require("telescope").setup({
  previewer = true,
  --file_previewer = require("telescope.previewers").cat.new,
  file_previewer = require("telescope.builtin").find_files,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
})

-- More modules
-- https://github.com/echasnovski/mini.nvim#modules
require('mini.align').setup()

-- Color
-- {{{
vim.g.catpuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  transparent_background = true,
  integrations = {
    coc_nvim = true,
    --coc_nvim = false,
    telescope = true,
    --    nvimtree = {
    --      enabled = true,
    --      show_root = true,
    --      transparent_panel = true,
    --    },
    gitgutter = true,
    markdown = true,
    notify = true,
  }
})
vim.cmd [[colorscheme catppuccin]]
-- }}}

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
vim.api.nvim_command("set listchars=tab:>~,nbsp:_,trail:.")
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
vim.api.nvim_command("set wrap")
vim.api.nvim_command("set textwidth=0")
vim.api.nvim_command(
  "autocmd BufNew,BufRead *.cc,*.h,*.cpp,*.c,*.java,*.sh,*.python,*.py,*.html,*.js,*.css,*.php,*.go,*.rs setlocal textwidth=79")

-- Folding
vim.api.nvim_command("set foldmethod=marker")
vim.api.nvim_command("autocmd FileType yaml set foldmethod=indent")
vim.api.nvim_command("autocmd FileType html set foldmethod=indent")
vim.api.nvim_command("autocmd FileType gohtmltmpl set foldmethod=indent")
vim.api.nvim_command("autocmd FileType go set foldmethod=syntax")
vim.api.nvim_command("autocmd FileType c set foldmethod=syntax")
vim.api.nvim_command("autocmd FileType markdown set foldmethod=expr")
vim.api.nvim_command("autocmd FileType markdown set foldexpr=NestedMarkdownFolds()")
---WORKAROUND
--vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
--vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter', 'CursorHold' }, {
--vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'CursorHold' }, {
--  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--  callback = function()
--    vim.opt.foldmethod = 'expr'
--    vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
--  end
--})
---ENDWORKAROUND

-- Toggle transparency
vim.g.transparency = 1
vim.api.nvim_set_hl(0, "Normal", { bg = None })
vim.api.nvim_set_hl(0, "Folded", { bg = None, fg = '#45475A' })

vim.api.nvim_create_user_command(
  "ToggleTransparency",
  function()
    if (vim.g.transparency == 0)
    then
      vim.g.transparency = 1
      vim.api.nvim_set_hl(0, "Normal", { bg = None })
      vim.api.nvim_set_hl(0, "Folded", { bg = None, fg = '#45475A' })
      --vim.api.nvim_set_hl(0, "ColorColumn", { bg = 'DarkGray', fg = 'White' })
      --vim.api.nvim_command("highlight ColorColumn ctermfg=white ctermbg=darkgray guifg=white guibg=darkgray")
      -- idk why I need this but I do
      vim.api.nvim_command("hi Folded ctermbg=None guibg=None")
      --vim.cmd [[ call matchadd('ColorColumn', '\%81v', 100) ]]
      print("Transparency on")
    else
      vim.g.transparency = 0
      vim.api.nvim_set_hl(0, "Normal", { bg = '#11111b' })
      vim.api.nvim_set_hl(0, "Folded", { bg = '#11111b', fg = '#BAC2DE' })
      --vim.api.nvim_set_hl(0, "ColorColumn", { bg = '#11111b', fg = '#BAC2DE' })
      vim.cmd [[ call matchadd('ColorColumn', '\%0v', 100) ]]
      print("Transparency off")
    end
  end,
  { bang = true, desc = 'Turns transparency on or off' }
)
-- }}}

-- Coc Options
-- {{{
vim.cmd [[set nobackup]]
vim.cmd [[set nowritebackup]]
vim.cmd [[set updatetime=300]]
vim.cmd [[set signcolumn=yes]]
vim.cmd [[autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')]]
-- }}}

vim.cmd [[set shortmess=A]]

vim.api.nvim_create_user_command(
  "BuildSummary",
  function()
    -- Find all
    --local row, column = unpack(vim.api.nvim_win_get_cursor(0))
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    --local lines = vim.api.nvim_buf_get_lines(0, row, -1, false)
    local lines = vim.api.nvim_buf_get_lines(0, linenr, -1, false)
    local titles = ""

    --for title in string.gmatch(table.concat(lines, "\n"), "##.+\n") do
    for k, v in pairs(lines) do
      --print(k,v)
      -- TODO: Figure out how to block ###+
      for title in string.gmatch(v, "## .+$") do
        title = title:gsub("## ", "")
        titles = titles ..
            "- [" .. title .. "](#" .. title:lower():gsub(" ", "-"):gsub(":", "") .. ")" .. "\n"
      end
    end

    vim.api.nvim_paste(titles, true, 1)

    --local lines_as_strings = table.concat(lines, "\n")
  end,
  { bang = true, desc = 'Build summary for markdown blogs' }
)

vim.api.nvim_create_user_command(
  "TitleSpace",
  function()
    --local linenr = vim.api.nvim_win_get_cursor(0)[1]
    --local curline = vim.api.nvim_buf_get_lines(
    --    0, linenr - 1, linenr, false)[1]
    local curline = vim.api.nvim_get_current_line()
    --curline = "\r\n" .. curline:gsub("([A-Z])", " %1")
    curline = curline:gsub("([A-Z])", " %1")
    curline = curline:gsub('" ', '"')
    --vim.api.nvim_del_current_line()
    --vim.api.nvim_paste(curline, true, 1)
    --vim.api.nvim_put(curline, "l", false, true)
    vim.api.nvim_set_current_line(curline)
  end,
  { bang = true, desc = 'Change text to title spacing for blog' }
)

-- Templates
-- {{{
local function paste_file(fileName)
  local file = io.open(fileName)
  if not file then return nil end
  local contents = file:read "*a"
  file:close()

  local base = vim.fn.expand('%:t:r') or "__default_file"
  local headerName = base .. ".h"

  contents = contents:gsub("{{_author_}}", "Stephen M. Reaves")
  contents = contents:gsub("{{_date_}}", os.date("%b %e, %Y"))
  contents = contents:gsub("{{_file_name_}}", vim.fn.expand('%:t'))
  contents = contents:gsub("{{_base_name_}}", base)
  contents = contents:gsub("{{_header_name_}}", headerName)
  contents = contents:gsub("{{_header_name_caps_}}", string.upper(base))

  vim.api.nvim_paste(contents, true, 1)
end

local function scandir(directory)
  local i = 0
  local t = {}
  local pFile = io.popen('ls "' .. directory .. '"')
  if pFile == nil then return t end

  for file in pFile:lines() do
    i = i + 1
    t[i] = file
  end
  pFile:close()

  return t
end

vim.api.nvim_create_user_command(
  "LoadTemplate",
  function()
    local actions = require "telescope.actions"
    local actions_state = require "telescope.actions.state"
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local sorters = require "telescope.sorters"

    local templateDir = os.getenv("HOME") .. "/.config/nvim/Templates"
    local file_table = {
      ["c"] = {
        dir = templateDir .. "/C/",
        files = scandir(templateDir .. "/C/")
      },
      ["mermaid"] = {
        dir = templateDir .. "/Mermaid/",
        files = scandir(templateDir .. "/Mermaid/")
      },
      ["h"] = {
        dir = templateDir .. "/H/",
        files = scandir(templateDir .. "/H/")
      },
      ["go"] = {
        dir = templateDir .. "/Go/",
        files = scandir(templateDir .. "/Go/")
      },
      ["rust"] = {
        dir = templateDir .. "/Rust/",
        files = scandir(templateDir .. "/Rust/")
      },
      ["markdown"] = {
        dir = templateDir .. "/Markdown/",
        files = scandir(templateDir .. "/Markdown/")
      },
      ["yaml"] = {
        dir = templateDir .. "/Yaml/",
        files = scandir(templateDir .. "/Yaml/")
      }
    }
    local ft = vim.bo.filetype

    local f = file_table[ft]
    if f == nil
    then
      if ft == nil or ft == '' then ft = "N/A" end
      print("No templates for filetype of: " .. ft)
      return
    end

    local function enter(prompt_buf_num)
      local selected = actions_state.get_selected_entry()
      actions.close(prompt_buf_num)
      paste_file(f.dir .. selected[1])
    end

    local opts = {
      finder = finders.new_table {
        results = f.files or { "None" }
      },
      results_title = "Template files in " .. f.dir,
      prompt_title = "Please enter a template name",
      preview_title = "Template preview",
      sorter = sorters.get_generic_fuzzy_sorter({}),
      attach_mappings = function(_, map)
        map("i", "<CR>", enter)
        return true
      end,
    }

    local test = pickers.new(opts)

    test:find()
  end,
  { bang = true, desc = 'Pick and load templates based on filetype' }
)
-- }}}

-- Status line
-- {{{
--require('lualine').setup()
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- Edited by: Stephen Reaves
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
  pink   = '#f5c2e7',
  yellow = '#f9e2af',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.pink },
    b = { fg = colors.black, bg = colors.yellow },
    c = { fg = colors.black, bg = 'none' },
    x = { fg = colors.black, bg = colors.yellow },
  },
  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = 'none' },
    b = { fg = colors.white, bg = 'none' },
    c = { fg = colors.white, bg = 'none' },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    --lualine_x = { vim.api.nvim_buf_get_var(0, 'coc_current_function') },
    lualine_x = {
      { separator = { left = '', right = '|' }, right_padding = 0, 'b:coc_current_function', ' ' }
      --{ 'b:coc_current_function', ' ' }
    },
    --lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {
    --lualine_a = { 'diff', colored = false },
    lualine_a = {
      {
        'diff',
        colored = false,
      }
    },
  },
  extensions = {},
}
-- }}}

-- Variables
-- {{{
vim.g["mkdp_browser"] = "firefox"
-- }}}
require('colorizer').setup()
