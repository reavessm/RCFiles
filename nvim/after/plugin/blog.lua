vim.api.nvim_create_user_command(
  "BuildSummary",
  function()
    -- Find all
    --local row, column = unpack(vim.api.nvim_win_get_cursor(0))
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    --local lines = vim.api.nvim_buf_get_lines(0, row, -1, false)
    local lines = vim.api.nvim_buf_get_lines(0, linenr, -1, false)
    local titles = ""

    --for title in string.gmatch(table.concat(lines, "\n"), "##.+\n") do
    for k, v in pairs(lines) do
      --print(k,v)
      -- TODO: Figure out how to block ###+
      for title in string.gmatch(v, "## .+$") do
        title = title:gsub("## ", "")
        titles = titles ..
            "- [" .. title .. "](#" .. title:lower():gsub(" ", "-"):gsub(":", "") .. ")" .. "\n"
      end
    end

    vim.api.nvim_paste(titles, true, 1)

    --local lines_as_strings = table.concat(lines, "\n")
  end,
  { bang = true, desc = 'Build summary for markdown blogs' }
)

vim.api.nvim_create_user_command(
  "TitleSpace",
  function()
    --local linenr = vim.api.nvim_win_get_cursor(0)[1]
    --local curline = vim.api.nvim_buf_get_lines(
    --    0, linenr - 1, linenr, false)[1]
    local curline = vim.api.nvim_get_current_line()
    --curline = "\r\n" .. curline:gsub("([A-Z])", " %1")
    curline = curline:gsub("([A-Z])", " %1")
    curline = curline:gsub('" ', '"')
    --vim.api.nvim_del_current_line()
    --vim.api.nvim_paste(curline, true, 1)
    --vim.api.nvim_put(curline, "l", false, true)
    vim.api.nvim_set_current_line(curline)
  end,
  { bang = true, desc = 'Change text to title spacing for blog' }
)
