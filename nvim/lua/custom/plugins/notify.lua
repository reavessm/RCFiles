-- Notify
return {
  "rcarriga/nvim-notify",
  version = "*",
  --build = "bash ./install.sh",
  config = function()
    require("notify").setup({})
  end
}
