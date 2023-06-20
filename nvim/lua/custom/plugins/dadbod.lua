-- Plugin
return {
  "kristijanhusak/vim-dadbod-ui",
  version = "*",
  dependencies = {
    "tpope/vim-dadbod"
  },
  config = function()
    vim.g.dbs = {
      -- This is test data for a db running in a personal k8s cluster, not accessible via the internet
      ['dev'] = 'postgresql://test:tAaOCyEm8WdKloLFVh9lbYmj@localhost:5432/test?sslmode=disable',    -- gitleaks:allow
      ['omscs'] = 'postgresql://test:tAaOCyEm8WdKloLFVh9lbYmj@localhost:5433/omscs?sslmode=disable', -- gitleaks:allow
    }


    vim.keymap.set('n', '<leader>db', '<cmd>DBUI<cr>',
      { desc = '[D]ata [B]ase (or Dad Bod)' })
  end
}
