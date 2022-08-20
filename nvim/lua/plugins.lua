-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use 'nvim-lua/plenary.nvim'

  -- requires luajit
  -- use {
    -- 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- requires = { { 'nvim-lua/plenary.vim' } }
  -- }

   use { 'neoclide/coc.nvim', branch = 'release' }

   -- Debugger Attachment Protocol
   use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }

  -- Color
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Markdown folding
  use { 'masukomi/vim-markdown-folding' }

end)