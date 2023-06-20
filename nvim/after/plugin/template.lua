local function paste_file(fileName)
  --{{{
  local file = io.open(fileName)
  if not file then return nil end
  local contents = file:read "*a"
  file:close()

  local base = vim.fn.expand('%:t:r') or "__default_file"
  local headerName = base .. ".h"

  local title = base:gsub("([A-Z])", " %1")
  title = title:gsub('" ', '"')
  title = title:gsub("^%l", string.upper)

  contents = contents:gsub("{{_author_}}", "Stephen M. Reaves")
  contents = contents:gsub("{{_date_}}", os.date("%b %e, %Y"))
  contents = contents:gsub("{{_date_str_}}", os.date("%Y-%m-%d"))
  contents = contents:gsub("{{_file_name_}}", vim.fn.expand('%:t'))
  contents = contents:gsub("{{_base_name_}}", base)
  contents = contents:gsub("{{_title_name_}}", title)
  contents = contents:gsub("{{_header_name_}}", headerName)
  contents = contents:gsub("{{_header_name_caps_}}", string.upper(base))

  vim.api.nvim_paste(contents, true, 1)
  --}}}
end

local function scandir(directory)
  --{{{
  local i = 0
  local t = {}
  local pFile = io.popen('ls "' .. directory .. '"')
  if pFile == nil then return t end

  for file in pFile:lines() do
    i = i + 1
    t[i] = file
  end
  pFile:close()

  return t
  --}}}
end

vim.api.nvim_create_user_command(
  "LoadTemplate",
  function()
    --{{{
    local actions = require "telescope.actions"
    local actions_state = require "telescope.actions.state"
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local sorters = require "telescope.sorters"

    local templateDir = os.getenv("HOME") .. "/.config/nvim/Templates"
    local file_table = {
      ["c"] = {
        dir = templateDir .. "/C/",
        files = scandir(templateDir .. "/C/")
      },
      ["h"] = {
        dir = templateDir .. "/H/",
        files = scandir(templateDir .. "/H/")
      },
      ["go"] = {
        dir = templateDir .. "/Go/",
        files = scandir(templateDir .. "/Go/")
      },
      ["lua"] = {
        dir = templateDir .. "/Lua/",
        files = scandir(templateDir .. "/Lua/")
      },
      ["markdown"] = {
        dir = templateDir .. "/Markdown/",
        files = scandir(templateDir .. "/Markdown/")
      },
      ["mermaid"] = {
        dir = templateDir .. "/Mermaid/",
        files = scandir(templateDir .. "/Mermaid/")
      },
      ["rust"] = {
        dir = templateDir .. "/Rust/",
        files = scandir(templateDir .. "/Rust/")
      },
      ["yaml"] = {
        dir = templateDir .. "/Yaml/",
        files = scandir(templateDir .. "/Yaml/")
      }
    }
    local ft = vim.bo.filetype

    local f = file_table[ft]
    if f == nil
    then
      if ft == nil or ft == '' then ft = "N/A" end
      print("No templates for filetype of: " .. ft)
      return
    end

    local function enter(prompt_buf_num)
      local selected = actions_state.get_selected_entry()
      actions.close(prompt_buf_num)
      paste_file(f.dir .. selected[1])
    end

    local opts = {
      finder = finders.new_table {
        results = f.files or { "None" }
      },
      results_title = "Template files in " .. f.dir,
      prompt_title = "Please enter a template name",
      preview_title = "Template preview",
      sorter = sorters.get_generic_fuzzy_sorter({}),
      attach_mappings = function(_, map)
        map("i", "<CR>", enter)
        return true
      end,
    }

    local test = pickers.new(opts)

    test:find()
    --}}}
  end,
  { bang = true, desc = 'Pick and load templates based on filetype' }
)

--vim.keymap.set('n', '<leader>lt', ':LoadTemplate<CR>', { desc = '[L]oad [T]emplate' })
