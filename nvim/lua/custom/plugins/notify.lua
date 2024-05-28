-- Notify
return {
  "rcarriga/nvim-notify",
  version = "*",
  --build = "bash ./install.sh",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
    })
  end
}
