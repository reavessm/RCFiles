vim.api.nvim_create_user_command(
  "BuildSummary",
  function()
    -- Find all
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(0, linenr, -1, false)
    local titles = ""

    for k, v in pairs(lines) do
      for title in string.gmatch(v, "#+ .+$") do
        local t, count = title:gsub("#", "")
        t = t:gsub("^%s", "")
        local prefix = ""
        for i = 3, count, 1 do
          prefix = prefix .. "  "
        end
        titles = titles ..
            prefix .. "- [" .. t .. "](#" .. t:lower():gsub(" ", "-"):gsub(":", ""):gsub("?", "") .. ")" .. "\n"
      end
    end

    vim.api.nvim_paste(titles, true, 1)
  end,
  { bang = true, desc = 'Build summary for markdown blogs' }
)

vim.api.nvim_create_user_command(
  "TitleSpace",
  function()
    local curline = vim.api.nvim_get_current_line()
    curline = curline:gsub("([A-Z])", " %1")
    curline = curline:gsub('" ', '"')
    vim.api.nvim_set_current_line(curline)
  end,
  { bang = true, desc = 'Change text to title spacing for blog' }
)
