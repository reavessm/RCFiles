-- Plugin
return {
  "norcalli/nvim-colorizer.lua",
  version = "*",
  config = function()
    require("colorizer").setup({
      css = { css = true, },
      'javascript',
      html = {
        mode = 'foreground',
      }
    })
  end
}
