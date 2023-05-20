return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 0.15, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        width = 80,
        height = 30,
        options = {
          signcolumn = "no",      -- disable signcolumn
          number = false,         -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false,     -- disable cursorline
          cursorcolumn = false,   -- disable cursor column
          foldcolumn = "0",       -- disable fold column
          list = false,           -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false,            -- disables the ruler text in the cmd line area
          showcmd = false,          -- disables the command in the last line of the screen
        },
        tmux = { enabled = false }, -- disables the tmux statusline
        -- this will change the font size on alacritty when in zen mode
        -- requires  Alacritty Version 0.10.0 or higher
        -- uses `alacritty msg` subcommand to change font size
        alacritty = {
          enabled = true,
          font = "25", -- font size
        },
      },
      -- callback where you can add custom code when the Zen window opens
      on_open = function(win)
        vim.api.nvim_command("TransparencyOff")
        -- Open folds 10 levels deep
        vim.o.foldlevel = 10
      end,
      -- callback where you can add custom code when the Zen window closes
      on_close = function()
        vim.api.nvim_command("TransparencyOn")
        -- Close all folds
        vim.o.foldlevel = 0
      end,
    })
  end
}
