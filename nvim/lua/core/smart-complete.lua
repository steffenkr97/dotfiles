-- ~/.config/nvim/lua/core/smart-complete.lua

local M = {}

function M.complete_statement()
  -- Zuerst in Normal Mode wechseln wenn in Insert Mode
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'i' then
    vim.cmd 'stopinsert'
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local col = cursor[2]
  local line = vim.api.nvim_get_current_line()
  local filetype = vim.bo.filetype

  -- Debug output
  print('Mode:', mode, 'Row:', row, 'Col:', col, 'Line:', line)

  -- Sprachen die Semicolons brauchen
  local semicolon_languages = {
    rust = true,
    c = true,
    cpp = true,
    java = true,
    javascript = true,
    typescript = true,
    go = true,
    cs = true,
  }

  local needs_semicolon = semicolon_languages[filetype]
  local before_cursor = line:sub(1, col + 1) -- +1 weil col 0-indexed ist

  -- Hilfsfunktion zum Zählen
  local function count_char(str, pattern)
    local _, count = str:gsub(pattern, '')
    return count
  end

  -- Zähle offene/geschlossene Klammern
  local open_parens = count_char(before_cursor, '%(') - count_char(before_cursor, '%)')
  local open_brackets = count_char(before_cursor, '%[') - count_char(before_cursor, '%]')
  local open_braces = count_char(before_cursor, '{') - count_char(before_cursor, '}')

  print('Open parens:', open_parens, 'brackets:', open_brackets, 'braces:', open_braces)

  -- Schließe offene runde Klammern
  if open_parens > 0 then
    local closing = string.rep(')', open_parens)
    if needs_semicolon then
      closing = closing .. ';'
    end
    vim.api.nvim_set_current_line(line .. closing)
    -- Neue Zeile einfügen
    vim.api.nvim_buf_set_lines(0, row, row, false, { '' })
    vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    vim.cmd 'startinsert!'
    return
  end

  -- Schließe offene eckige Klammern
  if open_brackets > 0 then
    local closing = string.rep(']', open_brackets)
    if needs_semicolon then
      closing = closing .. ';'
    end
    vim.api.nvim_set_current_line(line .. closing)
    vim.api.nvim_buf_set_lines(0, row, row, false, { '' })
    vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    vim.cmd 'startinsert!'
    return
  end

  -- Schließe offene geschweifte Klammern
  if open_braces > 0 then
    local indent = line:match '^%s*' or ''
    vim.api.nvim_buf_set_lines(0, row, row, false, { indent .. '    ', indent .. '}' })
    vim.api.nvim_win_set_cursor(0, { row + 1, #indent + 4 })
    vim.cmd 'startinsert!'
    return
  end

  -- Prüfe auf offene Strings
  local double_quotes = count_char(before_cursor, '"')
  local single_quotes = count_char(before_cursor, "'")

  if double_quotes % 2 == 1 then
    local closing = needs_semicolon and '";' or '"'
    vim.api.nvim_set_current_line(line .. closing)
    vim.api.nvim_buf_set_lines(0, row, row, false, { '' })
    vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    vim.cmd 'startinsert!'
    return
  end

  if single_quotes % 2 == 1 then
    local closing = needs_semicolon and "';" or "'"
    vim.api.nvim_set_current_line(line .. closing)
    vim.api.nvim_buf_set_lines(0, row, row, false, { '' })
    vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    vim.cmd 'startinsert!'
    return
  end

  -- Füge Semicolon hinzu wenn nötig
  if needs_semicolon and not line:match ';%s*$' and not line:match '[{},]%s*$' and line:match '%S' then
    vim.api.nvim_set_current_line(line .. ';')
  end

  -- Neue Zeile einfügen
  vim.api.nvim_buf_set_lines(0, row, row, false, { '' })
  vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
  vim.cmd 'startinsert!'
end

return M
