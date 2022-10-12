require("nvim-tree").setup({
    open_on_setup = false,
    view = {
        adaptive_size = true,
    },
    filters = {
        dotfiles = false,
        custom = { '^.git$' },
    },
    renderer = {
        highlight_git = true,
        group_empty = true,
        indent_markers = {
            enable = true,
            inline_arrows = true,
        },
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    untracked = "",
                    deleted = "",
                    ignored = "",
                }
            }
        }
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    }
})
