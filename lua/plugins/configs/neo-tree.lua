require("neo-tree").setup({
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
        filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    },
    source_selector = {
        winbar = false,
        statusline = false
    }
})
