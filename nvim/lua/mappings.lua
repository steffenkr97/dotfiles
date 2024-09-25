require "nvchad.mappings"
require "functions"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- obsidian mappings
map("n", "<leader>ot", "<cmd>lua search_todo()<CR>", {desc = "Search open ToDos"})