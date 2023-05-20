-- Run snippets of code
return {
  "michaelb/sniprun",
  version = "*",
  build = "bash ./install.sh",
  config = function()
    require("sniprun").setup({
      display = { "TempFloatingWindow" },
      borders = 'double',
    })
  end
}
