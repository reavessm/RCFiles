-- Run snippets of code
return {
  "michaelb/sniprun",
  version = "*",
  build = "bash ./install.sh build",
  config = function()
    require("sniprun").setup({
      -- display = { "NvimNotify" },
      display = { "Terminal" },
      --[[
      display = { "Classic" },
      display_options = {
        notification_timeout = 5
      },
      ]]
      -- display = { "TempFloatingWindow" },
      borders = 'double',
    })
  end
}
