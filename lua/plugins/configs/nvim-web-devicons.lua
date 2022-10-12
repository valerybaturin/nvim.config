require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        go = {
            icon = "ﳑ",
            color = "#00ADD8",
            -- cterm_color = "65",
            name = "Go"
        },
    };
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
}
