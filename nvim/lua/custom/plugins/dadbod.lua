-- Plugin
return {
  "kristijanhusak/vim-dadbod-ui",
  version = "*",
  dependencies = {
    "tpope/vim-dadbod"
  },
  config = function()
    vim.g.dbs = {
      ['dev'] = 'postgresql://test:tAaOCyEm8WdKloLFVh9lbYmj@localhost:5432/test?sslmode=disable',
      ['omscs'] = 'postgresql://test:tAaOCyEm8WdKloLFVh9lbYmj@localhost:5432/omscs?sslmode=disable',
    }


    vim.keymap.set('n', '<leader>db', '<cmd>DBUI<cr>',
      { desc = '[D]ata [B]ase (or Dad Bod)' })
  end
}
