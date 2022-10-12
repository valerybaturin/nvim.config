local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Open terminal with lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "curved",
    },
})

function Lazygit_toggle()
    lazygit:toggle()
end

keymap("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>", opts)

-- Go section
-- Add tags to struct
keymap("n", "<leader>ft", ":GoAddTag<CR>", opts)
keymap("n", "<leader>fs", ":GoFillStruct<CR>", opts)
keymap("n", "<leader>ge", ":GoIfErr<CR>", opts)
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Nvimtree
keymap("n", "<leader>fd", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>fo", ":NvimTreeFocus<cr>", opts)

-- Neo-Tree
-- keymap("n", "<leader>ft", "<cmd>NeoTreeShowToggle<CR>", opts)
-- keymap("n", "<leader>fo", "<cmd>Neotree<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble<CR>", opts)
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", opts)

-- Format SQL
keymap("v", "<C-f>", ":%!pg_format -f 2 -u 2 -i<CR>", opts)
