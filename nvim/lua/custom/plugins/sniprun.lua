-- Run snippets of code
return {
  "michaelb/sniprun",
  -- dir = "/home/reavessm/Src/sniprun",
  version = "*",
  -- build = "bash ./install.sh",
  build = "cargo build && cargo build --release",
  config = function()
    require("sniprun").setup({
      -- display = { "NvimNotify" },
      -- display_options = {
      --   notification_timeout = 5
      -- },
      --background_colour = "#000000",
      --[[
      display = { "Classic" },
      display_options = {
        notification_timeout = 5
      },
      ]]
      -- display = { "TempFloatingWindow" },
      borders = 'double',
      display = { "Terminal" },
      -- display = { "TempFloatingWindow" },
      -- borders = 'double',
      -- interpreter_options = {
      --   Http_original = {
      --     error_truncate = "long"
      --   }
      -- }
    })
  end
}
