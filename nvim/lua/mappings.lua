require "nvchad.mappings"
require "functions"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- obsidian mappings
map("n", "<leader>ost", "<cmd>lua search_todo()<CR>", { desc = "Search open ToDos" })
map("n", "<leader>od", "<cmd> :ObsidianDailies<CR>", { desc = "Open Dailies" })
map("n", "<leader>opi", "<cmd> :ObsidianPasteImg<CR>", { desc = "Paste Image" })
map("n", "<leader>ob", "<cmd> :ObsidianBacklinks<CR>", { desc = "Show Backlinks" })
map("n", "<leader>ol", "<cmd> :ObsidianLinks<CR>", { desc = "Show Links" })

-- Debugging
vim.keymap.set("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Debug Continue" })

vim.keymap.set("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step Over" })

vim.keymap.set("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })

vim.keymap.set("n", "<leader>du", function()
  require("dap").step_out()
end, { desc = "Step Out" })

vim.keymap.set("n", "<Leader>dt", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<Leader>dB", function()
  require("dap").set_breakpoint()
end, { desc = "Set Breakpoint" })

vim.keymap.set("n", "<Leader>dlp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { desc = "Breakpoint Log Message" })

vim.keymap.set("n", "<Leader>drr", function()
  require("dap").repl.open()
end, { desc = " Rel Open??" })

vim.keymap.set("n", "<Leader>drl", function()
  require("dap").run_last()
end, { desc = "Run Last" })

vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Hover UI" })

vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "Preview UI" })

vim.keymap.set("n", "<Leader>df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end, { desc = "Center Float Frame" })

vim.keymap.set("n", "<Leader>ds", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.scopes)
end, { desc = "Center Float Scopes" })
