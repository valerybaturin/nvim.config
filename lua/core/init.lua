local autocmd = vim.api.nvim_create_autocmd

-- local run_formatter = function(text)
--     local split = vim.split(text, "\n")
--     local result = table.concat(vim.list_slice(split, 2, #split - 1), "\n")

-- local bin = vim.api.nvim_get_runtime_file("~/.config/nvim/go_sql.py", false)[1]

-- local j = require("plenary.job"):new {
--     command = "pgformat",
-- args = { bin },
--     writer = { result },
-- }
-- return j:sync()
-- end

-- local embedded_sql = vim.treesitter.parse_query(
--     "go",
--     [[
-- (short_var_declaration
--     left: (expression_list
--         (identifier) @left (#eq? @left "query"))
--     (expression_list
--         (raw_string_literal) @sql)
-- )
-- ]])

-- local get_root = function(bufnr)
--     local parser = vim.treesitter.get_parser(bufnr, "go", {})
--     local tree = parser:parse()[1]
--     return tree:root()
-- end

-- local format_sql = function(bufnr)
--     bufnr = bufnr or vim.api.nvim_get_current_buf()
--
--     if vim.bo[bufnr].filetype ~= "go" then
--         vim.notify "can only be used in go"
--         return
--     end
--
--     local root = get_root(bufnr)
--
--     local changes = {}
--     for id, node in embedded_sql:iter_captures(root, bufnr, 0, -1) do
--         local name = embedded_sql.captures[id]
--         if name == "sql" then
--             local range = { node:range() }
--             local indentation = string.rep(" ", range[2])
--
--             local formatted = run_formatter(vim.treesitter.get_node_text(node, bufnr))
--
--             print(formatted)
--
--             for idx, line in ipairs(formatted) do
--                 formatted[idx] = indentation .. line
--             end
--
--             table.insert(changes, 1, { start = range[1] + 1, final = range[3], formatted = formatted })
--         end
--     end
--
--     for _, change in pairs(changes) do
--         vim.api.nvim_buf_set_lines(bufnr, change.start, change.final, false, change.formatted)
--     end
-- end

-- vim.api.nvim_create_user_command("SQLFormat", function()
--     format_sql()
-- end, {})

-- local group = vim.api.nvim_create_augroup("go-sql", { clear = true })
-- autocmd("BufWritePre", {
--     group = group,
--     pattern = { "*.go" },
--     callback = function()
--         format_dat_sql()
--     end
-- })

autocmd("BufWritePre", {
    pattern = { "*.go" },
    command = "GoImport",
})

autocmd("BufWritePre", {
    pattern = { "*.lua" },
    callback = function()
        vim.lsp.buf.formatting_sync(nil, 3000)
    end
})

autocmd("BufWritePre", {
    pattern = { "*.sql" },
    command = '%! pg_format -f 2 -u 2 -i'
})

-- autocmd("BufWritePre", {
-- 	pattern = { "*.go" },
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
-- 		params.context = {only = {"source.organizeImports"}}
--
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
-- 		for _, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
-- 				else
-- 					vim.lsp.buf.execute_command(r.command)
-- 				end
-- 			end
-- 		end
-- 	end,
-- })

-- Trim White Space
local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup('TrimWhiteSpaceGrp', {})
autocmd('BufWritePre', {
    group = TrimWhiteSpaceGrp,
    pattern = '*',
    command = '%s/\\s\\+$//e',
})
