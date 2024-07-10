-- Screenshot tool
-- requires `go install github.com/charmbracelet/freeze@latest`
return {
  "isabelroses/charm-freeze.nvim",
  config = function()
    require('freeze').setup({
      command = "freeze",
      output = function()
        return "./" .. os.date("%Y-%m-%d") .. "-freeze.svg"
      end,
      -- ~/.config/freeze/user.json
      config = "user",
    })
  end
}
