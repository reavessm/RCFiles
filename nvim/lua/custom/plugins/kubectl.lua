-- Control kubernetes resources in vim
return {
  "rottencandy/vimkubectl",
  version = "*",
  config = function()
    vim.g.vimkubectl_command = 'oc'
    -- These commands don't get <CR> at the end to allow for editing/confirming
    -- in the command buffer.
    vim.keymap.set('n', '<leader>oo', ':Kget deployments',
      { desc = '[O]penshift [O]pen' })
    vim.keymap.set('n', '<leader>on', ':Knamespace ',
      { desc = '[O]penshift [N]amespace' })
    vim.keymap.set('v', '<leader>oa', ':Kapply',
      { desc = '[O]penshift [A]pply' })
  end
}
