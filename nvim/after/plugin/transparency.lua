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
