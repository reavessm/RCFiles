-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	    -- Packer can manage itself
	    use 'wbthomason/packer.nvim'

	    --use 'nvim-lua/plenary.nvim'

	    -- requires luajit
	    use {
	        'nvim-telescope/telescope.nvim', tag = '0.1.0',
	        requires = {
	            { 'nvim-lua/plenary.nvim' },
	            { 'BurntSushi/ripgrep' }
	        }
	    }

	    use { 'neoclide/coc.nvim', branch = 'release' }

	    -- Debugger Attachment Protocol
	    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
	    use { 'leoluz/nvim-dap-go' }
	    use {
	        'nvim-treesitter/nvim-treesitter',
	        run = ':TSUpdate'
	    }

	    -- Color
	    use { "catppuccin/nvim", as = "catppuccin" }

	    -- Colorizer
	    use { "norcalli/nvim-colorizer.lua" }

	    -- Markdown folding
	    use { 'masukomi/vim-markdown-folding' }

	    -- Status line
	    use {
	        'nvim-lualine/lualine.nvim',
	        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	    }

	    -- Mermaid
	    use { 'mracos/mermaid.vim' }

	    -- install without yarn or npm
	    use({
	        "iamcco/markdown-preview.nvim",
	        run = function() vim.fn["mkdp#util#install"]() end,
	    })

--	    use({
--	        "iamcco/markdown-preview.nvim",
--	        run = "cd app && npm install",
--	        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
--	        ft = { "markdown" },
--	    })
    end)
