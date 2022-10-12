-- Telescope config
local map = vim.keymap.set
local opts = { noremap=true, silent=true }

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

require('telescope').setup{}
