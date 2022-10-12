require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { all },

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "phpdoc" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
    },
    playground = {
        enable = true,
    }
}
