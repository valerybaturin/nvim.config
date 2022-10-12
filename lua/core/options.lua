local opt = vim.opt

-- Numbers
opt.number = true
opt.numberwidth = 4
opt.ruler = false

opt.laststatus = 3
opt.showmode = false

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

opt.mouse = "a"

opt.smartcase = true
opt.ignorecase = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.wrap = false

opt.termguicolors = true

opt.timeoutlen = 400
opt.lazyredraw = true

vim.diagnostic.config({
    virtual_text = false,
})

vim.cmd('language en_US')
