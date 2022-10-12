local embedded_pg = vim.treesitter.parse_query(
    "go",
    [[
        (short_var_declaration
           left: (expression_list
                   (identifier) @left (#eq? @left "query"))
           (expression_list
             (raw_string_literal) @sql)
        )
    ]]
)
local get_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "go", {})
    local tree = parser:parse()[1]
    return tree:root()
end

local function formatter(str)
    str = str:gsub("`", "'")
    local cmd = "echo " .. str .. " | pg_format -f 2 -u 2"
    local output = {}
    local job = vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        on_stdout = function(_, data)
            if data then
                output = data
            end
        end,
        on_stderr = function(_, data)
            local err = table.concat(data)
            if data and err ~= "" then
                vim.notify("Improper sql syntax:", err)
            end
        end,
    })
    vim.fn.jobwait({ job })
    return output
end

local format_pg = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    if vim.bo[bufnr].filetype ~= "go" then
        vim.notify("can only be used in go")
        return
    end

    local root = get_root(bufnr)

    local changes = {}
    for id, node in embedded_pg:iter_captures(root, bufnr, 0, -1) do
        local name = embedded_pg.captures[id]
        if name == "sql" then
            local range = { node:range() }
            local indentation = "       "

            local formatted = formatter(vim.treesitter.get_node_text(node, bufnr))

            for idx, line in ipairs(formatted) do
                formatted[idx] = indentation .. line
            end

            table.insert(changes, 1, { start = range[1] + 1, final = range[3], formatted = formatted })
        end
    end

    for _, change in ipairs(changes) do
        vim.api.nvim_buf_set_lines(bufnr, change.start, change.final, false, change.formatted)
    end
end

vim.api.nvim_create_user_command("PgSqlMagic", function()
    format_pg()
end, {})

vim.api.nvim_create_autocmd({ "BufWritePre", "BufWritePost" }, {
    pattern = { "*.go" },
    callback = function()
        format_pg()
    end,
})
