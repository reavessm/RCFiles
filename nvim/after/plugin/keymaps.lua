vim.keymap.set('n', '<leader>nt', ':Neotree filesystem reveal<CR>)', { desc = '[N]eo[T]ree' })
vim.keymap.set('n', '<leader>nv', ':Neotree --dir ~/.config/nvim<CR>', { desc = '[N]eotree n[V]im' })

--Map("n", "<leader>rn", "<Plug>(coc-rename)")
--Map("n", "<leader>f>", "<Plug>(coc-format-selected)")
--Map("x", "<leader>f>", "<Plug>(coc-format-selected)")

-- Apply code action to current buffer
-- Example: `<leader>aap` for current paragraph
--Map("x", "<leader>a", "<Plug>(coc-codeaction-selected)<CR>")
--Map("n", "<leader>a", "<Plug>(coc-codeaction-selected)<CR>")

-- Quickfix
--Map("n", "<leader>qf", "<Plug>(coc-fix-current)<CR>")
--Map("n", "<leader>cl", "<Plug>(coc-codelens-action)<CR>")


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
--Map("x", "if", "<Plug>(coc-funcobj-i)")
--Map("o", "if", "<Plug>(coc-funcobj-i)")
--Map("x", "af", "<Plug>(coc-funcobj-a)")
--Map("o", "af", "<Plug>(coc-funcobj-a)")
--Map("x", "ic", "<Plug>(coc-classobj-i)")
--Map("o", "ic", "<Plug>(coc-classobj-i)")
--Map("x", "ac", "<Plug>(coc-classobj-a)")
--Map("o", "ac", "<Plug>(coc-classobj-a)")
--
-- vim.g.coc_snippet_prev = '<C-h>'
-- vim.g.coc_snippet_next = '<C-l>'

-- Rewrite input mode mappings
--Map("i", "<space>h", " h")
--Map("i", "<space>l", " l")
--vim.cmd [[iu "<leader>h"]]
--vim.cmd [[iu "<leader>l"]]

-- Copy & Paste
vim.keymap.set("v", "<C-c>", ":w! ~/.vimbuffer<CR>", { desc = '[C]opy' })
vim.keymap.set("n", "<C-p>", ":read ~/.vimbuffer<CR>", { desc = '[P]aste' })

-- Auto close
--vim.keymap.set("i", "<C-{>", "{<CR>}<Esc>ko")
--vim.keymap.set("i", "<C-(>", "()<++><Esc>F)i")
--vim.keymap.set("i", "<C-[>", "[]<++><Esc>F]i")
vim.keymap.set("i", "<C-l>", "<Esc>/<++><CR>:noh<CR>ca<")
--Map("n", "<C-l>", "/<++><CR>:noh<CR>ca<")



-- Move lines
vim.keymap.set("n", "<C-j>", "ddp")
vim.keymap.set("n", "<C-k>", "ddkP")

-- Bash vim closing
vim.api.nvim_command("autocmd FileType sh inoremap <silent> <buffer> {{ ${}<++><Esc>F{a")

-- Toggle GitGutter Highlighting
--Map("n", "<C-h>", ":GitGutterLineHighlightsToggle<CR>")
--Map("n", "<C-h>", "<Esc>:GitGutterLineHighlightsToggle<CR>i")

vim.keymap.set("n", "<C-t>", "<cmd>ToggleTransparency<CR>", { desc = "toggle [T]ransparency" })

--Map("n", "<leader>u", ":CocCommand git.chunkUndo<CR>")
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns reset_hunk<CR>", { desc = "[H]unk [U]ndo" })

vim.keymap.set("n", "gF", "99[{0")
--vim.keymap.set("n", "gD", "99[{0z<CR>")

--vim.cmd [[inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]]


vim.keymap.set("n", "<leader>lt", "<cmd>LoadTemplate<CR>")

-- Find files using Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
-- Requires ripgrep
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")

-- Debugger
--Map("n", "<leader>do", "<cmd>lua require('dapui').open()<CR>")
--Map("n", "<leader>dc", "<cmd>lua require('dapui').close()<CR>")
--Map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
--Map("n", "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>")
--Map("n", "<leader>ds", "<cmd>lua require('dap').continue()<CR>")
--Map("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
--Map("n", "<leader>do", "<cmd>lua require('dap').step_over()<CR>")
--Map("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")

-- Spellcheck
vim.keymap.set("n", "<leader>ss", "<cmd>set spell spelllang=en_us<CR>")
vim.keymap.set("n", "<leader>so", "<cmd>set nospell<CR>")
vim.keymap.set("n", "<leader>sa", "zg")
vim.keymap.set("n", "<leader>sc", "z=")
vim.keymap.set("n", "<leader>sn", "]s")
vim.keymap.set("n", "<leader>sp", "[s")

-- Fold Tags
vim.keymap.set("n", "<leader>fto", "I<CR><Esc>k0i#{{{<Esc>0Eld$")
vim.keymap.set("n", "<leader>ftc", "A<CR><Esc>0i#}}}<Esc>0Eld$")

vim.keymap.set("n", "<leader>bs", "<cmd>BuildSummary<CR>", { desc = "[B]uild [S]ummary" })
vim.keymap.set("n", "<leader>ts", "<cmd>TitleSpace<CR>", { desc = "[T]itle [S]pace" })

vim.keymap.set('n', '<leader>at', '<cmd>AerialToggle!<CR>', { desc = "[A]erial [T]oggle" })

vim.keymap.set("n", "<leader>tf", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true, desc = "[T]rouble [F]ind" }
)

vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<cr>",
  { silent = true, noremap = true, desc = "[T]o[D]o" }
)

vim.keymap.set("n", "<leader>zm", "<cmd>ZenMode<cr>", { desc = "[Z]en [M]ode" })

vim.keymap.set("n", "<leader>rs", "<cmd>source $MYVIMRC<CR>", { desc = "[R]e[S]tart neovim" })

vim.keymap.set("n", "<leader>rf", "<cmd>%SnipRun<cr>", { desc = "[R]un [F]ile" })
vim.keymap.set("n", "<leader>rl", "V<Plug>SnipRun", { desc = "[R]un [L]ine" })
vim.keymap.set("n", "<leader>ri", "vif<Plug>SnipRun", { desc = "[R]un [I]nside function" })
vim.keymap.set("x", "<leader>ri", "<Plug>SnipRun", { desc = "[R]un [I]nside selection" })

vim.keymap.set("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", { desc = "[M]arkdown [P]review" })

vim.keymap.set("n", "<leader>css", "<cmd>Freeze<CR>", { desc = "[C]ode [S]creen [S]hot" })
vim.keymap.set("v", "<leader>css", ":Freeze<CR>", { desc = "[C]ode [S]creen [S]hot" })
