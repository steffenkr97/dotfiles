-- My Custom functions
local telescope_builtin = require('telescope.builtin')

-- Search for open todos by searching "- [ ]"
function search_todo()
  telescope_builtin.grep_string({
    search = "- [ ]",
    use_regex = false,
  })
end

