require "nvchad.mappings"
require "functions"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- obsidian mappings
map("n", "<leader>ost", "<cmd>lua search_todo()<CR>", {desc = "Search open ToDos"})
map("n", "<leader>od", "<cmd> :ObsidianDailies<CR>", {desc = "Open Dailies"})
map("n", "<leader>opi", "<cmd> :ObsidianPasteImg<CR>", {desc = "Paste Image"})
map("n", "<leader>ob", "<cmd> :ObsidianBacklinks<CR>", {desc = "Show Backlinks"})
map("n", "<leader>ol", "<cmd> :ObsidianLinks<CR>", {desc = "Show Links"})
