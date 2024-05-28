-- Swiss army knife of plugins
return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    -- [Modules](https://github.com/echasnovski/mini.nvim#modules)
    require("mini.align").setup({
      mappings = {
        start = '',
        start_with_preview = '<leader>al'
      }
    })
    require("mini.starter").setup({
      header = "Hello, Stephen"
    })
    require("mini.indentscope").setup({})
    require("mini.bracketed").setup({})
  end
}
