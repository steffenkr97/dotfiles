-- Lua Funktion für die Suche nach '- [ ]'
local telescope_builtin = require('telescope.builtin')

function search_todo()
  telescope_builtin.grep_string({
    search = "- [ ]",
    use_regex = false,
  })
end

