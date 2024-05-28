-- Run snippets of code
return {
  "iamcco/markdown-preview.nvim",
  version = "*",
  build = "bash -c cd app && yarn install",
  init = function()
    -- vim.g.mkdp_markdown_css = expand('~/.config/nvim/lua/custom/plugins/preview.css')
    vim.g.mkdp_markdown_css = '/home/sreaves/.config/nvim/lua/custom/plugins/preview.css'
  end
}
