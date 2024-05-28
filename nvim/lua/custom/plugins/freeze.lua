-- Plugin
return {
  "isabelroses/charm-freeze.nvim",
  config = function()
    require("charm-freeze").setup({
      command = "freeze",
      output = function()
        return "./" .. os.date("%Y-%m-%d") .. "-freeze.svg"
      end,
      config = "user",
    })
  end
}
