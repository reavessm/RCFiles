-- Functional wrapper for mapping custom keybindings
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

-- CoC Explorer
Map("n", "<leader>ee", ":CocCommand explorer<CR>")
Map("n", "<leader>ed", ":CocCommand explorer --root-uri ~/.config/nvim<CR>")
Map("n", "<leader>ec", ":CocCommand explorer --root-uri ~/.config/coc<CR>")
Map("n", "<leader>ef", ":CocCommand explorer --position floating --open-action-strategy sourceWindow<CR>")

-- List all presets
Map("n", "<leader>el", ":CocList explPresets<CR>")

-- CoC
Map("n", "gC", "<Plug>(coc-git-nextconflict)<CR>")
Map("n", "gd", "<Plug>(coc-definition)")
Map("n", "gr", "<Plug>(coc-references)")
Map("n", "gy", "<Plug>(coc-type-definition)")
Map("n", "gi", "<Plug>(coc-implementation)")
Map("n", "g[", "<Plug>(coc-diagnostic-prev)")
Map("n", "g]", "<Plug>(coc-diagnostic-next)")
Map("n", "K", ":call ShowDocumentation()<CR>")

vim.cmd [[
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
]]

Map("n", "<leader>rn", "<Plug>(coc-rename)")
Map("n", "<leader>f>", "<Plug>(coc-format-selected)")
Map("x", "<leader>f>", "<Plug>(coc-format-selected)")

-- Apply code action to current buffer
-- Example: `<leader>aap` for current paragraph
Map("x", "<leader>a", "<Plug>(coc-codeaction-selected)<CR>")
Map("n", "<leader>a", "<Plug>(coc-codeaction-selected)<CR>")

-- Quickfix
Map("n", "<leader>qf", "<Plug>(coc-fix-current)")
Map("n", "<leader>cl", "<Plug>(coc-codelens-action)")


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
Map("x", "if", "<Plug>(coc-funcobj-i)")
Map("o", "if", "<Plug>(coc-funcobj-i)")
Map("x", "af", "<Plug>(coc-funcobj-a)")
Map("o", "af", "<Plug>(coc-funcobj-a)")
Map("x", "ic", "<Plug>(coc-classobj-i)")
Map("o", "ic", "<Plug>(coc-classobj-i)")
Map("x", "ac", "<Plug>(coc-classobj-a)")
Map("o", "ac", "<Plug>(coc-classobj-a)")

vim.g.coc_snippet_prev = '<C-h>'
vim.g.coc_snippet_next = '<C-l>'

-- Rewrite input mode mappings
--Map("i", "<space>h", " h")
--Map("i", "<space>l", " l")
--vim.cmd [[iu "<leader>h"]]
--vim.cmd [[iu "<leader>l"]]

-- Copy & Paste
Map("v", "<C-c>", ":w! ~/.vimbuffer<CR>")
Map("n", "<C-v>", ":read ~/.vimbuffer<CR>")

Map("i", "{{", "{<CR>}<Esc>ko")
Map("i", "((", "()<++><Esc>F)i")
Map("i", "[[", "[]<++><Esc>F]i")

Map("i", "<C-l>", "<Esc>/<++><CR>:noh<CR>ca<")
--Map("n", "<C-l>", "/<++><CR>:noh<CR>ca<")


-- Move lines
Map("n", "<c-j>", "ddp")
Map("n", "<c-k>", "ddkP")

-- Bash vim closing
vim.api.nvim_command("autocmd FileType sh inoremap {{ ${}<++><Esc>F{a")

-- Toggle GitGutter Highlighting
Map("n", "<C-h>", ":GitGutterLineHighlightsToggle<CR>")
Map("n", "<C-h>", "<Esc>:GitGutterLineHighlightsToggle<CR>i")

Map("n", "<C-t>", ":ToggleTransparency<CR>")

Map("n", "<leader>u", ":CocCommand git.chunkUndo<CR>")

Map("n", "gF", "99[{0")
Map("n", "gD", "99[{0z<CR>")

vim.cmd [[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]]


Map("n", "<leader>lt", "<cmd>LoadTemplate<CR>")
