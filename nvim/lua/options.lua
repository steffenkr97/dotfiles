require "nvchad.options"

-- add yours here!
vim.opt.conceallevel = 1

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!


-- my vim-tree
local nvimtree = require("nvim-tree")
require("nvim-tree").setup({
    view = {
      adaptive_size = true
    },
  })
